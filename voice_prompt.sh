#!/bin/bash

# voice_prompt.sh - miqro: micro voice-to-text for AI prompting
# Usage: ./voice_prompt.sh [duration_in_seconds]
# Origin: QRY Labs ecosystem - born from context loss frustration

DURATION=${1:-10}  # Default 10 seconds
AUDIO_FILE="/tmp/voice_input_$(date +%s).wav"
TEXT_FILE="/tmp/voice_text_$(date +%s).txt"

echo "🎤 Recording for ${DURATION} seconds... Press Ctrl+C to stop early"

# Smart audio device detection with proper initialization timing
FOCUSRITE_DEVICE=""
HYPERX_DEVICE=""

# Check for Focusrite Scarlett
if arecord -l 2>/dev/null | grep -i "focusrite\|scarlett" >/dev/null; then
    CARD_NUM=$(arecord -l 2>/dev/null | grep -i "focusrite\|scarlett" | head -1 | sed 's/card \([0-9]\).*/\1/')
    if [ -n "$CARD_NUM" ]; then
        FOCUSRITE_DEVICE="hw:$CARD_NUM,0"
        echo "🎵 Found Focusrite on $FOCUSRITE_DEVICE"
    fi
fi

# Check for HyperX
if arecord -l 2>/dev/null | grep -i "hyperx" >/dev/null; then
    CARD_NUM=$(arecord -l 2>/dev/null | grep -i "hyperx" | head -1 | sed 's/card \([0-9]\).*/\1/')
    if [ -n "$CARD_NUM" ]; then
        HYPERX_DEVICE="hw:$CARD_NUM,0"
        echo "🎧 Found HyperX on $HYPERX_DEVICE"
    fi
fi

# Device selection with appropriate timing
if [ -n "$FOCUSRITE_DEVICE" ]; then
    DEVICE="$FOCUSRITE_DEVICE"
    DEVICE_NAME="Focusrite Scarlett"
    INIT_TIME=2.5
    echo "🎵 Using Focusrite Scarlett (professional audio interface)"
elif [ -n "$HYPERX_DEVICE" ]; then
    DEVICE="$HYPERX_DEVICE"
    DEVICE_NAME="HyperX Cloud III Wireless"
    INIT_TIME=1.5
    echo "🎧 Using HyperX Cloud III Wireless"
else
    DEVICE="default"
    DEVICE_NAME="Default Audio Device"
    INIT_TIME=0.5
    echo "🔊 Using default audio device"
fi

# Device initialization with proper timing
echo "⏳ Initializing $DEVICE_NAME..."
sleep $INIT_TIME

echo "Ready in:"
sleep 0.5
echo "3..."
sleep 1
echo "2..."
sleep 1
echo "1..."
sleep 1
echo "GO! 🔴"

# Small delay for audio buffer stabilization
sleep 0.3

# Record with extra buffer time and gain boost
RECORD_DURATION=$((DURATION + 1))
if [ "$DEVICE" = "default" ]; then
    timeout $RECORD_DURATION sox -d -r 16000 -c 1 "$AUDIO_FILE" gain 10 2>/dev/null || true
else
    timeout $RECORD_DURATION sox -t alsa "$DEVICE" -r 16000 -c 1 "$AUDIO_FILE" gain 10 2>/dev/null || \
    timeout $RECORD_DURATION sox -d -r 16000 -c 1 "$AUDIO_FILE" gain 10 2>/dev/null || true
fi

echo "🔊 Used $DEVICE_NAME"

if [ ! -f "$AUDIO_FILE" ]; then
    echo "❌ No audio recorded"
    exit 1
fi

echo "🧠 Transcribing with Whisper..."
# Check audio levels first
echo "📊 Audio file size: $(ls -lh "$AUDIO_FILE" | awk '{print $5}')"

# Use small model for better accuracy on rambling speech
whisper "$AUDIO_FILE" --model small --language English --output_format txt --output_dir /tmp/ --verbose False --temperature 0.2 --condition_on_previous_text True

# Find the generated text file (whisper adds timestamp to filename)
WHISPER_OUTPUT=$(find /tmp -maxdepth 1 -name "voice_input_*.txt" -newer "$AUDIO_FILE" 2>/dev/null | head -1)

if [ -f "$WHISPER_OUTPUT" ]; then
    # Clean up the text and display
    TRANSCRIBED_TEXT=$(cat "$WHISPER_OUTPUT" | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
    
    echo ""
    echo "📝 Transcribed text:"
    echo "===================="
    echo "$TRANSCRIBED_TEXT"
    echo "===================="
    echo ""
    
    # Copy to clipboard if xclip is available
    if command -v xclip >/dev/null 2>&1; then
        echo "$TRANSCRIBED_TEXT" | xclip -selection clipboard
        echo "📋 Copied to clipboard!"
    fi
    
    # Save to a consistent filename for easy access
    echo "$TRANSCRIBED_TEXT" > "$TEXT_FILE"
    echo "💾 Saved to: $TEXT_FILE"
    
    # Clean up audio and whisper's temp file
    rm -f "$AUDIO_FILE" "$WHISPER_OUTPUT"
else
    echo "❌ Transcription failed"
    rm -f "$AUDIO_FILE"
    exit 1
fi 