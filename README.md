# 🚀 Cursor API Rate Limit Template
**Purpose:** Reusable framework for managing LLM (Gemini/Sonnet) rate limits and token efficiency in Cursor projects.

---

## ⚡ QUICK START: READ THIS FIRST
To ensure maximum token efficiency and avoid "429 Rate Limit" errors, you **must** call this protocol early in your project life-cycle.

### 1. Install Files
Copy `AI_COLLABORATION_PROTOCOL.md` and `PROGRESS_TRACKER.md` into your project's root directory.

### 2. Give Context to your Cursor Agent
Immediately after installing, paste the following command into your Cursor Agent chat:

> **"Please read the `AI_COLLABORATION_PROTOCOL.md` in the root directory. From now on, follow the Batching, Caching, and Token Efficiency rules defined there. Use `PROGRESS_TRACKER.md` to log our session usage and ensure we stay under the 1M token/minute limit."**

---

## 📋 What's Included?
*   **[AI_COLLABORATION_PROTOCOL.md](AI_COLLABORATION_PROTOCOL.md)**: The "Rules of Engagement" for the AI (Grouped reads, atomic edits, internal caching).
*   **[PROGRESS_TRACKER.md](PROGRESS_TRACKER.md)**: A structured log for tracking tokens turn-by-turn.

---
**Author:** Adam Scheurer  
**Last Updated:** January 13, 2026
