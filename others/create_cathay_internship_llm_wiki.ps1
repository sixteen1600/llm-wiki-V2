param(
    [string]$RootPath = ".\internship_llm_wiki",
    [switch]$CleanOldRawFolders
)

# ============================================================
# Create Internship LLM-Wiki Project Structure
# Purpose:
#   Build a stable Obsidian + Codex + LLM-Wiki directory
#   for internship learning records.
#
# Design:
#   - raw/imported_notes stores original mixed Markdown notes.
#   - logs stores time-based summaries.
#   - wiki stores topic-based formal knowledge.
#   - indexes stores navigation pages.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File .\create_internship_llm_wiki.ps1
#
# Optional root path:
#   powershell -ExecutionPolicy Bypass -File .\create_internship_llm_wiki.ps1 -RootPath "D:\Obsidian\internship_llm_wiki"
#
# Optional cleanup:
#   powershell -ExecutionPolicy Bypass -File .\create_internship_llm_wiki.ps1 -CleanOldRawFolders
#
# Cleanup behavior:
#   - Removes raw/screenshots and raw/attachments only if they are empty
#     or contain only .gitkeep.
#   - Does not delete non-empty folders.
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host "Creating Internship LLM-Wiki project at: $RootPath"
Write-Host ""

# ---------- Root ----------
New-Item -ItemType Directory -Force -Path $RootPath | Out-Null

# ---------- Directories ----------
$dirs = @(
    # Raw source layer
    "raw/imported_notes",
    "raw/inbox",
    "raw/processed",

    # Time-based log layer
    "logs/daily",
    "logs/weekly",
    "logs/monthly",
    "logs/meetings",

    # Formal wiki knowledge layer
    "wiki/concepts",
    "wiki/tools",
    "wiki/workflows",
    "wiki/tasks",
    "wiki/projects",
    "wiki/troubleshooting",
    "wiki/data_notes",
    "wiki/business_context",
    "wiki/glossary",

    # Formal assets layer
    "assets/images",
    "assets/diagrams",
    "assets/files",

    # Templates, indexes, prompts
    "templates",
    "indexes",
    "prompts",

    # Archive
    "archive/old_notes",
    "archive/deprecated"
)

foreach ($dir in $dirs) {
    $path = Join-Path $RootPath $dir
    New-Item -ItemType Directory -Force -Path $path | Out-Null
}

# ---------- Root Files ----------
$rootFiles = @(
    "AGENTS.md",
    "README.md",
    "PROJECT_RULES.md",
    "CODEX_WORKFLOW.md",
    "OBSIDIAN_GUIDE.md"
)

foreach ($file in $rootFiles) {
    $path = Join-Path $RootPath $file
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# ---------- Template Files ----------
$templateFiles = @(
    "daily_log.md",
    "weekly_summary.md",
    "monthly_review.md",
    "meeting_note.md",
    "task_note.md",
    "project_note.md",
    "concept_note.md",
    "tool_note.md",
    "workflow_note.md",
    "troubleshooting_note.md",
    "data_note.md"
)

foreach ($file in $templateFiles) {
    $path = Join-Path $RootPath ("templates/" + $file)
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# ---------- Index Files ----------
$indexFiles = @(
    "home.md",
    "learning_index.md",
    "task_index.md",
    "project_index.md",
    "tool_index.md",
    "workflow_index.md",
    "troubleshooting_index.md",
    "data_index.md",
    "glossary_index.md"
)

foreach ($file in $indexFiles) {
    $path = Join-Path $RootPath ("indexes/" + $file)
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# ---------- Prompt Files ----------
$promptFiles = @(
    "codex_ingest_imported_note.md",
    "codex_summarize_daily_log.md",
    "codex_create_wiki_note.md",
    "codex_update_indexes.md",
    "codex_weekly_review.md"
)

foreach ($file in $promptFiles) {
    $path = Join-Path $RootPath ("prompts/" + $file)
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# ---------- .gitkeep Files ----------
$gitkeepDirs = @(
    "raw/imported_notes",
    "raw/inbox",
    "raw/processed",

    "logs/daily",
    "logs/weekly",
    "logs/monthly",
    "logs/meetings",

    "wiki/concepts",
    "wiki/tools",
    "wiki/workflows",
    "wiki/tasks",
    "wiki/projects",
    "wiki/troubleshooting",
    "wiki/data_notes",
    "wiki/business_context",
    "wiki/glossary",

    "assets/images",
    "assets/diagrams",
    "assets/files",

    "archive/old_notes",
    "archive/deprecated"
)

foreach ($dir in $gitkeepDirs) {
    $path = Join-Path $RootPath (Join-Path $dir ".gitkeep")
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path | Out-Null
    }
}

# ---------- Optional Cleanup ----------
if ($CleanOldRawFolders) {
    $oldRawDirs = @(
        "raw/screenshots",
        "raw/attachments"
    )

    foreach ($dir in $oldRawDirs) {
        $path = Join-Path $RootPath $dir

        if (Test-Path $path) {
            $items = Get-ChildItem $path -Force | Where-Object { $_.Name -ne ".gitkeep" }

            if ($items.Count -eq 0) {
                Remove-Item $path -Recurse -Force
                Write-Host "Removed empty old raw folder: $path"
            }
            else {
                Write-Host "Skipped non-empty old raw folder: $path"
            }
        }
    }
}

Write-Host ""
Write-Host "Project structure created successfully."
Write-Host ""
Write-Host "RootPath: $RootPath"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Open the folder with Obsidian."
Write-Host "2. Open the folder with Codex Desktop."
Write-Host "3. Fill AGENTS.md, PROJECT_RULES.md, CODEX_WORKFLOW.md, and templates."
Write-Host "4. Put original mixed Markdown notes under raw/imported_notes/."
