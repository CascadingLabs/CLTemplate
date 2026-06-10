# CLTemplate

Language-agnostic scaffold for every Cascading Labs repo. Contains the files every CL repo should have, with language-specific sections either commented out (in `.gitignore`, `.pre-commit-config.yaml`) or left as TODOs (in `CONTRIBUTING.md`, `README.md`).

## What's in the box

| File                                   | Purpose                                                  |
|----------------------------------------|----------------------------------------------------------|
| `LICENSE`                              | Apache 2.0                                               |
| `CODE_OF_CONDUCT.md`                   | Contributor Covenant 2.1, pointing at the CL Discord     |
| `SECURITY.md`                          | Vulnerability reporting policy                           |
| `SUPPORT.md`                           | Where to get help (Discord, GitHub issues, email)        |
| `CONTRIBUTING.md`                      | Setup, prek, PR rules, conventional commits              |
| `README.md`                            | Logo + badge header, Related projects, Community, Contact |
| `.editorconfig`                        | Cross-language baseline + per-language overrides         |
| `.gitignore`                           | OS/editor/secrets baseline + commented language sections |
| `.pre-commit-config.yaml`              | pre-commit-hooks, gitleaks, commitizen + language TODOs  |
| `renovate.json`                        | Weekly schedule, security PRs prioritized                |
| `AGENTS.md`                            | Shared project instructions for agents and collaborators |
| `CLAUDE.md`                            | Thin Claude bridge back to `AGENTS.md`                   |
| `opencode.json`                        | Loads shared project docs in OpenCode                    |
| `.agents/skills/*`                     | Starter repo skills for orientation, planning, validation |
| `.github/pull_request_template.md`     | Intent / Changes / GenAI / Risks / Checklist             |
| `.github/ISSUE_TEMPLATE/*.yaml`        | Bug / Feature / Question / Ticket forms + config         |
| `media/`                               | Drop `logo-dark.svg` and `logo-light.svg` here           |

## Using it

```bash
./bootstrap.sh CLFoo "One-line tagline for CLFoo"
cd ../CLFoo
git init && git add . && git commit -m "feat: initial scaffold from CLTemplate"
```

The script:

1. Copies everything in this directory except `.git`, `bootstrap.sh`, and `TEMPLATE.md` into `../CLFoo/`.
2. Replaces `{{PROJECT_NAME}}` → `CLFoo` and `{{PROJECT_TAGLINE}}` → your tagline in every file.

After bootstrapping, open these files and fill in project-specific details:

- `README.md` -- Usage and Development sections
- `CONTRIBUTING.md` -- Clone & Setup commands
- `.gitignore` -- uncomment the language section(s) you need
- `.pre-commit-config.yaml` -- uncomment the language hooks you need
- `.github/ISSUE_TEMPLATE/1_bug_report.yaml` -- tweak the version/platform fields to match
- `AGENTS.md` -- replace placeholder repo notes with actual shared project truth, including architecture, constraints, and validation commands
- `.agents/skills/repo-orientation/` -- customize once the repo shape is real
- `.agents/skills/change-planning/` -- adapt to the repo's actual boundaries and planning habits
- `.agents/skills/verification-plan/` -- adapt to the repo's real validation commands and test tiers
- `media/` -- drop in logos (see `Assets/README.md` for the tile template)

## Updating the template

When you improve a pattern in a downstream repo (say, a better pre-commit hook config), copy it back here so future repos benefit. The template is a source of truth, not a one-way branch.

Agent conventions follow the same promotion path:

```text
checkout experiment
  -> repeated usefulness
  -> project-committed convention
  -> if broadly reusable, backported into the template
```

The template should seed shape, not fake repo truth. Keep private per-clone capabilities in ignored checkout-local files such as `.local/`, `AGENTS.local.md`, and `CLAUDE.local.md` until they are ready to promote.

## Token reference

| Token                  | Replaced with                         |
|------------------------|---------------------------------------|
| `{{PROJECT_NAME}}`     | The CamelCase repo name, e.g. `CLFoo` |
| `{{PROJECT_TAGLINE}}`  | The short description                 |

If you need more tokens later (e.g. a project-specific Discord invite, a docs URL), add them to `bootstrap.sh` and document them here.
