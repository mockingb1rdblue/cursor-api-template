# 🚀 Cursor API & Environment Template
**Author:** mock1ng  
**Purpose:** A reusable framework for managing LLM rate limits, token efficiency, and consistent Cursor environments.

---

## 📋 Features
*   **[AI Collaboration Protocol](AI_COLLABORATION_PROTOCOL.md)**: Rules for AI efficiency (Batching, Caching, Atomic Edits).
*   **[Progress Tracker](PROGRESS_TRACKER.md)**: Token usage & session log.
*   **[Environment Sync](config/)**: Exported Cursor extensions, global settings, and keybindings.
*   **[Markdown UI](.vscode/)**: Custom dark-mode CSS for beautiful Markdown previews.

---

## ⚡ QUICK START: INITIALIZE A NEW PROJECT
To use the Rate Limit Protocol in a new project:
1. Copy `AI_COLLABORATION_PROTOCOL.md` and `PROGRESS_TRACKER.md` to the project root.
2. (Optional) Copy `.vscode/` folder to get the Markdown styling in your new project.
3. Tell your Cursor Agent:
   > "Read `AI_COLLABORATION_PROTOCOL.md` and follow the efficiency rules. Use `PROGRESS_TRACKER.md` to log our session usage."

---

## 🎨 Markdown Styling
This template includes a custom `.vscode/markdown-dark.css` and `settings.json` to ensure your documentation looks consistent and professional in the preview pane.

---

## 🛠️ Maintenance
To update the exported config with your current settings:

**Windows:**
```cmd
cursor --list-extensions > config\extensions.txt
copy "%APPDATA%\Cursor\User\settings.json" config\global-settings.json
copy "%APPDATA%\Cursor\User\keybindings.json" config\keybindings.json
```

**Linux/Mac:**
```bash
cursor --list-extensions > config/extensions.txt
cp "$HOME/Library/Application Support/Cursor/User/settings.json" config/global-settings.json  # Mac
# OR
cp "$HOME/.config/Cursor/User/settings.json" config/global-settings.json  # Linux
cp "$HOME/Library/Application Support/Cursor/User/keybindings.json" config/keybindings.json  # Mac
# OR
cp "$HOME/.config/Cursor/User/keybindings.json" config/keybindings.json  # Linux
```

---
**Last Updated:** January 13, 2026
