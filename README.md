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
3. Tell your Cursor Agent:
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

**Last Updated:** January 13, 2026
