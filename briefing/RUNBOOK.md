# Morning briefing — runbook

How to generate the morning briefing. Follow in order. The briefing is for
Pip's own orientation; Jimmy does not need to see it.

## 1. Orient

- Read `~/workspace/pip-daily/briefing/TEMPLATE.md`.
- Note today's date and weekday (America/Chicago). Validate with
  `date` on the machine; never guess the weekday.

## 2. Overnight results

- `cron.list` — check for jobs that ran overnight; note completions and failures.
- `hooks.list` — check hook activity (e.g. the DropPilot landing-copy watch).
- `subagent.list` — any child agents that finished or failed overnight.
- Summarize: one line per item, outcome + whether it needs follow-up.

## 3. Scheduled jobs health

- For each cron (`cron.list`) and hook (`hooks.list`): name, schedule, last-run
  status. Flag anything overdue, failing, erroring, or disabled that shouldn't be.
- Do not "fix" jobs by broadening their scope. Repair within existing scope;
  if a job can't be repaired, disable it and note it in the briefing.

## 4. Open loops

- `tracking.list` (or the tracking tools) — open commitments and their due dates.
- Search memory (`muse.memory_search`) for promises with time language like
  "in the morning", "tomorrow", "will check" from the last 48 hours.
- Check `~/MEMORY.md` and the last two daily notes for anything marked
  unresolved.

## 5. Memory & context

- Read the tail of `~/MEMORY.md` and the most recent daily note(s) under
  `~/memory/`.
- Note anything from the last 24h worth carrying forward. If it's durable and
  not yet saved, append it to today's daily note (`~/memory/YYYY-MM-DD.md`)
  in the established extraction format.

## 6. Write the briefing

- Fill in `TEMPLATE.md` and write it to
  `~/workspace/pip-daily/briefings/YYYY-MM-DD.md` (local only — never commit
  briefings to the repo).
- Keep it tight. Facts first, no filler.

## 7. Decide on silence

- Default: stay silent. The briefing is for Pip, not a status ping for Jimmy.
- Notify Jimmy ONLY if something genuinely needs his attention this morning:
  a promise coming due, a failure he should know about, or news he asked to be
  told (e.g. "tell me when X goes live").
- When notifying, lead with what's true now and keep it short.

## 8. Privacy

- The playbook (template, runbook, scripts) may live in the repo.
- Generated briefings and anything containing Jimmy's personal details stay
  local and are never pushed.
