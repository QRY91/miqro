# miqro - Origin Story
*"Because context loss is the developer's oldest enemy"*

## The Recursive Tool Evolution Loop 🔄

**Date**: June 6, 2025  
**Location**: QRY Labs ecosystem  
**Catalyst**: Perfect demonstration of the very problem we were solving

## The Problem That Started It All

User had successfully built an excellent audio transcription tool called **miqro** but completely lost track of which AI conversation helped set it up. The working code existed, the results were great, but the **context was gone**. 

Classic developer nightmare: *"I built something that works perfectly, but I have no idea how I built it."*

## The Context Loss Detective Story

### The Discovery
- User remembered using OpenAI Whisper
- Suspected the conversation happened in `qry_labs` directory  
- Found breadcrumb: terminal window still open at `/home/qry/stuff/projects/miqro`
- **Lucky break**: WezTerm lightweight enough to leave open (unlike *certain resource-heavy editors*)

### The Hunt
- Searched cursor chat exports for "whisper" mentions
- **JACKPOT**: Found entire miqro creation story in `cursor_evaluate_strengths_and_weaknesse.md`
- Full conversation preserved: setup, debugging, optimization, final working version

### The Irony
While extracting the miqro script to solve context loss:
1. AI put file in wrong directory (wherewasi instead of miqro)
2. Demonstrated the exact problem miqro was meant to solve
3. Had to use ecosystem tools (uroboro) to document the scrambling
4. Perfect recursive validation of the entire QRY Labs approach

## Technical Evolution

### Version 1.0 (Original Chat)
```bash
# Basic whisper integration
whisper "$AUDIO_FILE" --model turbo
```

### Version 2.0 (Device Detection)
```bash
# Smart audio device detection
# HyperX vs Focusrite vs default
# Proper initialization timing
```

### Version 3.0 (Final)
```bash
# Optimized for "rambling tangent" speech patterns
# Temperature 0.2 + condition_on_previous_text True
# Gain boost + audio buffer management
```

## The Recursive Pattern

```
Context Loss → Tool Creation → Context Loss (during creation) → Tool Rescue → Context Preservation
```

**Every QRY Labs tool emerges from:**
1. **Frustration** with existing limitations
2. **System thinking** about root causes  
3. **Recursive discovery** of deeper patterns
4. **Meta-validation** through building process itself

## Why "miqro"?

- **Micro** voice-to-text tool
- **Flemish heritage**: Follows sjiek DNA (sjiek = "gum", miqro = "micro")
- **Evolution chain**: satorislurp → sjiek → wherewasi → miqro
- **Philosophy**: Small, focused, invisible until needed

## Core Features

### Smart Device Detection
- **Focusrite Scarlett**: 2.5s init (professional audio interface)
- **HyperX Cloud III**: 1.5s init (USB wireless headset)  
- **Default device**: 0.5s init (built-in/fallback)

### Speech Optimization
- **16kHz sampling** - optimal for speech recognition
- **Gain boost** - compensates for varying microphone levels
- **Buffer management** - captures speech from "GO!" moment
- **Rambling-friendly** - handles incomplete thoughts and tangents

### Workflow Integration
- **Clipboard integration** - ready for AI prompting
- **Temporary file cleanup** - no audio clutter
- **Error handling** - graceful failure modes
- **Visual feedback** - clear status throughout process

## Usage Patterns

### AI Pair Programming
```bash
./voice_prompt.sh 30    # Long explanation
# Transcription auto-copied to clipboard
# Paste into AI chat for discussion
```

### uroboro Integration  
```bash
./voice_prompt.sh 15    # Quick insight capture
# Manually move to uroboro for systematic storage
```

### QRY Labs Development
- Voice rambling about game design insights
- Spoken documentation of technical discoveries
- Verbal processing of systematic patterns
- Quick capture during flow states

## Lessons Learned

### Technical
- **USB audio devices need initialization time**
- **Professional interfaces ≠ faster (more complex setup)**
- **Speech recognition optimizes for conversation, not dictation**
- **Buffer management matters more than sample rate**

### Meta
- **Context loss is universal developer problem**
- **Tool creation process validates tool necessity**  
- **Recursive failure → recursive solution**
- **Lightweight tools survive better than heavy ones**

### Ecosystem
- **Every tool strengthens every other tool**
- **Documentation prevents context loss**
- **Origin stories preserve decision rationale**
- **Failure modes are features when handled systematically**

## The Meta-Lesson

Building miqro while losing context of miqro perfectly demonstrated why miqro needed to exist. The scrambling, the detective work, the uroboro captures, the file hunting - all validation that **context preservation is essential** for systematic development.

The recursive nature isn't a bug, it's a feature. Every QRY Labs tool emerges from the exact frustration it's designed to solve.

---

*"Sometimes you have to lose context to understand why context matters."*

**File rescued**: `voice_prompt.sh` - ready for systematic voice-to-AI workflows  
**Context preserved**: This entire origin story  
**Ecosystem validated**: Tools helping tools help tools  
**Loop closed**: ∞ 