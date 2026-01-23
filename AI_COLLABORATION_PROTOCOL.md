# AI Collaboration Protocol: Cline + DeepSeek/Gemini

**For:** Cline using DeepSeek Reasoning as **Plan**, Gemini Flash 3 as **Act**.

***

## 🎯 1. Strategy: Roles and "Single Source of Truth"

### Role Assignment

- **Planner (DeepSeek Reasoning):**
  - Architecture, refactors, debugging strategy, and non-trivial reasoning.
  - "What should we do?"
- **Actor (Gemini Flash 3):**
  - High-volume code edits, reading many files, fast iteration, running tests.
  - "Do the work exactly as planned."

### Single Source of Truth: `status.md`

Instead of relying on long, brittle chat histories, all cross-role context must be routed through `status.md`.

***

## 🧠 2. Planner Protocol (DeepSeek Reasoning)

**Goal:** Produce concrete, numbered implementation plans with minimal token use and minimal file reads.

### Rules for Planner

- **Read `status.md` first.**
- **Focus ONLY on:**
  - Clarifying the goal.
  - Producing a step-by-step plan.
  - Identifying risks, unknowns, and invariants.
- **Update `status.md` sections:**
  - `Current Goal`
  - `Plan (from DeepSeek)`
  - `Open Problems`
  - `Next Actions`
- **Do NOT make large code edits.**

***

## ⚙️ 3. Actor Protocol (Gemini Flash 3)

**Goal:** Perform large, efficient operations based on the plan in `status.md`.

### Rules for Actor

- **Treat `status.md` as the spec.**
- **Implement the plan step by step.**
- **Update `status.md` after each major step:**
  - Append bullet points under `Work Done (by Gemini)`.
  - Keep `Open Problems` and `Next Actions` accurate.
- **Context Management:**
  - If context is getting large (Check context usage > 80%):
    - Summarize everything important into `status.md`.
    - Stop and wait for another PLANNER pass or start a `/new_task`.

***

## 🔁 4. The Loop: Plan → Act → Handoff

### Step 1 – Plan with DeepSeek
Start a new task with DeepSeek.
Prompt:
> ROLE: PLANNER
> Read `status.md` and the following files: `…`.
> Clarify the current goal, then produce a concrete, numbered implementation plan, filling in the “Plan (from DeepSeek)” and “Next Actions” sections in `status.md`.
> Do NOT implement code; just update `status.md`.

### Step 2 – Act with Gemini
Switch to Gemini Flash 3.
Start a new task with this prompt:
> ROLE: ACTOR
> Use `status.md` as the spec.
> Implement the steps in “Plan (from DeepSeek)”, keeping `status.md` up to date.
> After implementing 1–3 steps, stop and show me the diff.

### Step 3 – Handoff Back to Planner
When reasoning is needed again or context is full:
> Summarize everything important into `status.md` and then stop so the PLANNER can resume.

***

## 📋 5. Session Checklist

- [ ] Ensure `.clinerules` is present and enforced.
- [ ] Initialize/Update `status.md` at the start of every phase.
- [ ] Use `/new_task` frequently to clear context and resume from `status.md`.
- [ ] Verify each major plan step before moving to the next.