# scripts

This folder contains PowerShell helper scripts for the internship LLM Wiki workflow.

The scripts do not call a fixed Codex CLI command. Instead, each script creates a Markdown request file under `.codex_requests/` and copies the request content to the clipboard when possible. Paste that request into Codex Desktop.

## Usage

Run commands from the project root.

```powershell
.\scripts\show_workflow.ps1
.\scripts\import_note.ps1 raw\inbox\note.md
.\scripts\generate_daily.ps1 raw\imported_notes\2026\2026_07_03_Fri.md -Date 2026-07-03
.\scripts\extract_wiki.ps1 logs\daily\2026-07-03.md
.\scripts\update_indexes.ps1 wiki\concepts\proof_of_concept.md
.\scripts\weekly_summary.ps1 logs\daily\2026-07-03.md -Week 2026-W27
.\scripts\monthly_review.ps1 logs\weekly\2026-W27.md -Month 2026-07
.\scripts\meeting_note.ps1 raw\imported_notes\2026\2026_07_03_Fri.md -Date 2026-07-03 -Topic poc_review
.\scripts\sensitive_review.ps1 logs\daily\2026-07-03.md -Mode ReviewOnly
```

## Common options

- `-NoClipboard`: create the request file without copying content to the clipboard.
- `-Open`: open the generated request file after creation.

## Design rule

PowerShell files should contain execution logic only. Long-form task instructions belong in `prompts/*.md`.
