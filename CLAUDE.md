# Replies
- Lead with the answer. Keep replies short: a few sentences for a question, a short table or bullets when there are
  several items. Detail goes in a file or a report, not the chat.
- No boilerplate: no disclaimers, no legal notices, no restating what I asked, no repeating warnings already given
  once in the session, no closing offers.
- Routine steps inside a task I already asked for do not need my confirmation. Ask only before destructive,
  irreversible, client-facing or money-related actions, and then ask everything in one message.
- When asking me to decide, show the options and what you need from me in one place, so I can answer once.

# Estimates
- Estimate in YOUR execution time, not human developer hours. You work in minutes: a typical change
  (endpoint + migration + tests, a page with a form, a script) is 5-30 minutes of your wall-clock;
  a multi-file feature is 1-3 hours; a day is a very large piece of work. Never quote "2-3 days" for
  something you could finish in this session.
- Split every estimate into three lines and label them: (1) your execution time, (2) my time
  (review, decisions, testing on my side), (3) external waits (deploys, client approvals, DNS,
  app-store review). Only (3) is measured in days.
- If the estimate is for a client-facing timeline, say so, give the real number first, and let
  me add the buffer. Don't pad silently.
- Anchor on evidence: if a similar task was done earlier in this session or repo, cite how long
  it actually took.

# Dates
- Never work out a weekday, a date, or "tomorrow / next Monday / in 3 days" in your head. Run
  `date` first (the machine is on Asia/Kolkata), and compute with `date -d '<expr>' '+%a %d %b %Y'`.
- Always write dates with the weekday: "Thu 24 Sep 2026". If a message or file says only "Monday",
  resolve it to a full date before using it.
- Timestamps inside transcripts, logs and APIs are usually UTC. Convert to IST before telling me
  when something happened.
