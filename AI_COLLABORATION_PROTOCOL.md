# AI Collaboration Protocol: Rate Limit & Efficiency Master Guide
**For:** Gemini/Claude API (e.g., 1M tokens/minute cap)  

---

## 🎯 1. Strategy: Batch, Cache, Optimize

### Token Budget Management
- **Target:** Stay under 80% of the minute limit (e.g., 800,000 for a 1M cap).
- **Emergency:** If hitting 90%+, pause 30-60 seconds before the next batch.

### Caching Protocol (Internal)
- **Read Once:** The AI should maintain a session memory. Do NOT re-read files unless they have been modified.
- **Reference Content:** Reference line numbers from previous reads instead of re-pulling full text.
- **Summary Caching:** For large files, use generated summaries.

### Batching Protocol
- **Parallel Reads:** Group related file reads (up to 10) in a single turn.
- **Atomic Edits:** Combine multiple search/replace or write operations into one response.
- **Consolidated Commands:** Group terminal commands with `&&` or `;`.

---

## 🚀 2. Practical Usage Guide

### Discovery Efficiency
- **Use `grep` First:** Quick lookups instead of full file reads.
- **Context Truncation:** Long outputs should be summarized to keep the context window clear.

### Token Estimation Reference
| Tier | Operations | Cost Est. |
| :--- | :--- | :--- |
| **Low** | Read 1-3 small files, update single doc | <50K |
| **Medium** | Read 5-10 files, batch edits, consolidations | 50-200K |
| **High** | Read large files (>1000 lines), complex refactoring | 200K+ |

---

## 📋 3. Session Checklist
- [ ] Check `PROGRESS_TRACKER.md` for current status.
- [ ] Plan batch operations and estimate token cost.
- [ ] Batch related operations and cache file reads.
- [ ] Update `PROGRESS_TRACKER.md` after each logical batch.
