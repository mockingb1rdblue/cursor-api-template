# 🚀 Cline Two-Role Agent Template (Cursor)

**Purpose:** A reusable framework for managing LLM efficiency, long-context stability, and consistent Cursor/Cline workflows using a DeepSeek (Planner) + Gemini (Actor) architecture.

---

## 📋 Features

*   **[Two-Role Agent System](AI_COLLABORATION_PROTOCOL.md)**: Optimized workflow using **DeepSeek Reasoning** (Planner) for strategy and **Gemini Flash 3** (Actor) for execution.
*   **[Status Single Source of Truth (status.md)](status.md)**: A compact, curated state file that prevents context window bloating and allows seamless model handoffs.
*   **[Automated Setup](setup.sh)**: Scripts to quickly initialize the template in any new or existing project.
*   **[Enforced Protocols (.clinerules)](.clinerules)**: System-level instructions for Cline to maintain role boundaries and state synchronization.
*   **[Environment Config](config/)**: Exported Cursor extensions, global settings, and keybindings.

---

## ⚡ QUICK START

### 1. Initialize Your Project

Run the setup script in your project root to copy the necessary template files:

**Bash (Linux/Mac/WSL):**
```bash
# If you have the repo cloned:
./setup.sh /path/to/your/project
```

**PowerShell (Windows):**
```powershell
# If you have the repo cloned:
.\setup.ps1 -TargetDir "C:\path\to\your\project"
```

### 2. Configure Cline Providers

In Cline settings within Cursor:
- **PLANNER:** Configure **DeepSeek** (via OpenRouter or DeepSeek API). Use `deepseek-reasoner`.
- **ACTOR:** Configure **Gemini** (Google AI Studio). Use `gemini-2.0-flash`.

### 3. Start the Loop

1. **Plan:** Switch to **DeepSeek** and start a new task:
   > ROLE: PLANNER. Read status.md. Clarify the goal and produce a numbered plan. Only update status.md.
2. **Act:** Switch to **Gemini Flash 3** and start a new task:
   > ROLE: ACTOR. Use status.md as the spec. Implement the plan step-by-step. Update status.md as you go.

---

## 🛠️ Maintenance & Sync

To update the exported config with your current Cursor settings:

**Windows:**
```powershell
cursor --list-extensions > config\extensions.txt
copy "$env:APPDATA\Cursor\User\settings.json" config\global-settings.json
copy "$env:APPDATA\Cursor\User\keybindings.json" config\keybindings.json
```

**Mac/Linux:**
```bash
cursor --list-extensions > config/extensions.txt
cp "$HOME/Library/Application Support/Cursor/User/settings.json" config/global-settings.json # Mac
# cp "$HOME/.config/Cursor/User/settings.json" config/global-settings.json # Linux
```