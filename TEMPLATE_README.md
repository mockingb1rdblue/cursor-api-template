# 🚀 Cursor API & Environment Template
**Author:** mock1ng  
**Purpose:** A reusable framework for managing LLM rate limits, token efficiency, and consistent Cursor environments.

---

## 📋 Features

*   **[AI Collaboration Protocol](AI_COLLABORATION_PROTOCOL.md)**: Rules for AI efficiency (Batching, Caching, Atomic Edits).
*   **[Progress Tracker](PROGRESS_TRACKER.md)**: Token usage & session log.
*   **[Environment Config](config/)**: Exported Cursor extensions, global settings, and keybindings.
*   **[Markdown UI](.vscode/)**: Custom dark-mode CSS for beautiful Markdown previews.

---

## ⚡ QUICK START

### Using This Template as a Reference

To pull this repository for reference (not as a base for your project):

```bash
git clone https://github.com/mockingb1rdblue/cursor-api-template.git
cd cursor-api-template
```

**For Cursor Agents:** This repository is a **reference template**. When working with this repo:
- **Do NOT** copy files into the root of this repository
- **Do NOT** modify the template files directly
- **DO** reference the protocols and structure when initializing new projects
- **DO** read `AI_COLLABORATION_PROTOCOL.md` to understand the efficiency rules
- **DO** use `PROGRESS_TRACKER.md` as a template to copy into new projects

### Initialize a New Project

1. Copy `AI_COLLABORATION_PROTOCOL.md` and `PROGRESS_TRACKER.md` to your project root.
2. (Optional) Copy `.vscode/` folder to get the Markdown styling in your new project.
3. Add the template files to your project's `.gitignore` (see example below).
4. Tell your Cursor Agent:
   > "Read `AI_COLLABORATION_PROTOCOL.md` and follow the efficiency rules. Use `PROGRESS_TRACKER.md` to log our session usage."

---

## 🎨 Markdown Styling

This template includes a custom `.vscode/markdown-dark.css` and `settings.json` to ensure your documentation looks consistent and professional in the preview pane.

---

## 🛠️ Maintenance

To update the exported config with your current Cursor settings:

**Windows:**
```cmd
cursor --list-extensions > config\extensions.txt
copy "%APPDATA%\Cursor\User\settings.json" config\global-settings.json
copy "%APPDATA%\Cursor\User\keybindings.json" config\keybindings.json
```

**Linux/Mac:**
```bash
cursor --list-extensions > config/extensions.txt
# Mac
cp "$HOME/Library/Application Support/Cursor/User/settings.json" config/global-settings.json
cp "$HOME/Library/Application Support/Cursor/User/keybindings.json" config/keybindings.json
# Linux
cp "$HOME/.config/Cursor/User/settings.json" config/global-settings.json
cp "$HOME/.config/Cursor/User/keybindings.json" config/keybindings.json
```

---

## 📝 Adding Template Files to .gitignore

When you copy template files into a new project, add them to your project's `.gitignore` to prevent conflicts:

**Example .gitignore entries:**
```gitignore
# Cursor API Template files (project-specific, not tracked)
AI_COLLABORATION_PROTOCOL.md
PROGRESS_TRACKER.md
```

**Or if you want to keep them but track them separately:**
```gitignore
# Cursor API Template files (optional - remove if you want to track these)
# AI_COLLABORATION_PROTOCOL.md
# PROGRESS_TRACKER.md
```

**Example code to add to .gitignore (PowerShell):**
```powershell
# Add template files to .gitignore
Add-Content -Path .gitignore -Value "`n# Cursor API Template files"
Add-Content -Path .gitignore -Value "AI_COLLABORATION_PROTOCOL.md"
Add-Content -Path .gitignore -Value "PROGRESS_TRACKER.md"
```

**Example code to add to .gitignore (Bash):**
```bash
# Add template files to .gitignore
echo "" >> .gitignore
echo "# Cursor API Template files" >> .gitignore
echo "AI_COLLABORATION_PROTOCOL.md" >> .gitignore
echo "PROGRESS_TRACKER.md" >> .gitignore
```

---

**Last Updated:** January 13, 2026
