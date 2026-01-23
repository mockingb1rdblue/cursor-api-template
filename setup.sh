#!/bin/bash

# setup.sh - Initialize a project with the Cline Two-Role Agent Template
# Usage: ./setup.sh [project_directory]

TARGET_DIR=${1:-"."}
REPO_RAW_URL="https://raw.githubusercontent.com/mockingb1rdblue/cursor-api-template/main"

echo "🚀 Initializing Cline Template in: $TARGET_DIR"

# Ensure target directory exists
mkdir -p "$TARGET_DIR"

# Template files to ensure are present
FILES=(".clinerules" "AI_COLLABORATION_PROTOCOL.md" "CHANGELOG.md" "status.md")

for file in "${FILES[@]}"; do
    DEST_FILE="$TARGET_DIR/$file"
    
    if [ ! -f "$DEST_FILE" ]; then
        # Check if local source exists (relative to script)
        SRC_FILE="$(dirname "$0")/$file"
        
        if [ -f "$SRC_FILE" ]; then
            echo "📄 Copying $file from local source..."
            cp "$SRC_FILE" "$DEST_FILE"
        else
            echo "🌐 Downloading $file from GitHub..."
            curl -sSL "$REPO_RAW_URL/$file" -o "$DEST_FILE"
            if [ $? -ne 0 ]; then
                echo "❌ Failed to download $file"
            fi
        fi
    else
        echo "⚠️  $file already exists, skipping."
    fi
done

# Special case for status.md: Initialize content if it's empty
if [ ! -s "$TARGET_DIR/status.md" ]; then
    echo "📝 Initializing status.md content..."
    cat <<EOT > "$TARGET_DIR/status.md"
# Project Status

**Phase:** Plan | Build | Debug
**Planner Model:** DeepSeek Reasoning
**Actor Model:** Gemini Flash 3

## Current Goal
Initial project setup and verification.

## Plan (from DeepSeek)
1. Initialize repository and template files.
2. Verify .clinerules enforcement.
3. Establish baseline project structure.

## Work Done (by Gemini)
- [x] Ran setup.sh script.
- [x] Verified template file presence.

## Open Problems
- None.

## Next Actions
- Define the project's primary objectives.
EOT
fi

echo "✨ Setup complete! You can now start a new task in Cline using the PLANNER role (DeepSeek)."