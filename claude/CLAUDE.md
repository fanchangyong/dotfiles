@RTK.md

# Comments

Match the comment density of the surrounding file. If the existing code has no comments,
add none.

- Never comment what the code already says. `// increment i` and `// set up the router`
  are noise; delete them.
- Comment only the non-obvious: why this approach over the obvious one, a workaround for
  an upstream bug (link it), a non-local invariant, a unit or bound that isn't in the type.
- No section-header comments (`// ---- Helpers ----`), no restating a function's signature
  above it, no docstring on a function whose name and types are self-explanatory.
- Never narrate your edit in a comment: no `// added`, `// changed to fix X`,
  `// NEW`, `// was: ...`. That belongs in the commit message, not the file.
- Do not add comments to code you didn't otherwise have to touch.

## Don't document what we abandoned

When we try approach A, then remove it or switch to B, the code ends up as if A never
existed. Write it that way. Do not add a comment or doc explaining why A is gone, why B
won, or that A was tried — that history is in the conversation and the commit, and the
file should read as though B was always the design.

The test: would a reader who never saw this conversation be confused without the comment?
A "why not X" note earns its place only when X is what a competent reader would reach for
first anyway — the tempting stdlib call that deadlocks here, the obvious index that the
query planner ignores. If X only came up because we happened to try it, cut it.

This applies to whole artifacts too: no `MIGRATION.md`, no "Previous approach" section,
no commented-out A left below B. Delete A. If the removal is user-visible, the CHANGELOG
line is the one place it belongs.

# Writing docs

Write for someone who already knows the domain and is in a hurry.

- Lead with the answer or the command. No preamble, no "In this section we will…".
- Cut: restating the request back, summarizing what you just wrote, "Note that…",
  "It's important to…", closing recaps, and lists of caveats nobody asked about.
- Prefer a short paragraph or a code block over a bulleted list of one-line bullets.
- One example, chosen well, beats three variations of the same example.
- Don't create README/SUMMARY/NOTES files unless asked. Don't add a doc section for a
  change that a CHANGELOG line already covers.
- When editing existing docs, match their length and voice — don't expand a terse doc.

# Browser testing and debugging

For any frontend work that needs a real browser — E2E testing, reproducing a UI bug,
inspecting console errors, checking what actually rendered — drive it with the
`playwright-cli` CLI from the terminal (see the `playwright-cli` skill).

- Do not hand-write a one-off Playwright script to click through a page. Use the CLI.
- Do not point browser tooling at a personal or long-lived Chrome profile (e.g. a
  `--remote-debugging-port` Chrome). Those profiles carry unrelated logged-in sessions,
  and dumping their storage state writes real auth tokens to disk. Let Playwright own a
  disposable browser instead.
- `pnpm exec playwright test` (or the project's equivalent) is still the right tool for a
  committed test suite. The CLI is for exploration and debugging.

# Machine-local

Work-specific rules live outside this repo: @~/.claude/work.md

