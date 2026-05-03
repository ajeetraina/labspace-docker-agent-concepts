#!/bin/bash
# setup.sh
# Runs before Step 2 in the labspace environment.
# Pre-populates API keys so students don't have to paste them manually.

set -e

echo "🐳 Docker Agent Lab — pre-loading API keys..."
echo ""

PROFILE_FILE="$HOME/.bashrc"
KEYS_LOADED=0

# ── OpenAI ────────────────────────────────────────────────────────────────────
if [ -n "${OPENAI_API_KEY}" ]; then
  grep -q "OPENAI_API_KEY" "$PROFILE_FILE" 2>/dev/null || \
    echo "export OPENAI_API_KEY=${OPENAI_API_KEY}" >> "$PROFILE_FILE"
  echo "✅ OPENAI_API_KEY pre-loaded"
  KEYS_LOADED=$((KEYS_LOADED + 1))
else
  echo "⚠️  OPENAI_API_KEY not found in environment (students will enter manually)"
fi

# ── Anthropic ─────────────────────────────────────────────────────────────────
if [ -n "${ANTHROPIC_API_KEY}" ]; then
  grep -q "ANTHROPIC_API_KEY" "$PROFILE_FILE" 2>/dev/null || \
    echo "export ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}" >> "$PROFILE_FILE"
  echo "✅ ANTHROPIC_API_KEY pre-loaded"
  KEYS_LOADED=$((KEYS_LOADED + 1))
else
  echo "⚠️  ANTHROPIC_API_KEY not found in environment (students will enter manually)"
fi

# ── Google / Gemini ───────────────────────────────────────────────────────────
if [ -n "${GOOGLE_API_KEY}" ]; then
  grep -q "GOOGLE_API_KEY" "$PROFILE_FILE" 2>/dev/null || \
    echo "export GOOGLE_API_KEY=${GOOGLE_API_KEY}" >> "$PROFILE_FILE"
  echo "✅ GOOGLE_API_KEY pre-loaded"
  KEYS_LOADED=$((KEYS_LOADED + 1))
else
  echo "⚠️  GOOGLE_API_KEY not found in environment (students will enter manually)"
fi

echo ""
if [ "$KEYS_LOADED" -gt 0 ]; then
  echo "🎉 $KEYS_LOADED key(s) pre-loaded. Students can skip manual entry for those providers."
else
  echo "ℹ️  No keys pre-loaded. Students will enter them manually in Step 2."
fi
echo ""
echo "🐳 Lab environment is ready!"
