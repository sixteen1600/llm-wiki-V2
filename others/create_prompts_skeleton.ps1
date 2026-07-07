# create_prompts.ps1
# 用途：建立 prompts/ 資料夾與空白 prompt markdown 檔案
# 執行位置：請在 internship_llm_wiki 專案根目錄執行

$ErrorActionPreference = "Stop"

$PromptDir = "prompts"

$PromptFiles = @(
    "01_import_raw_note.md",
    "02_generate_daily_log.md",
    "03_extract_wiki_notes.md",
    "04_update_indexes.md",
    "05_generate_weekly_summary.md",
    "06_generate_monthly_review.md",
    "07_process_meeting_note.md",
    "08_sensitive_info_review.md"
)

# 建立 prompts 資料夾
if (-not (Test-Path $PromptDir)) {
    New-Item -ItemType Directory -Path $PromptDir | Out-Null
    Write-Host "Created folder: $PromptDir"
} else {
    Write-Host "Folder already exists: $PromptDir"
}

# 建立空白 markdown 檔案
foreach ($File in $PromptFiles) {
    $FilePath = Join-Path $PromptDir $File

    if (-not (Test-Path $FilePath)) {
        New-Item -ItemType File -Path $FilePath | Out-Null
        Write-Host "Created file: $FilePath"
    } else {
        Write-Host "File already exists, skipped: $FilePath"
    }
}

Write-Host ""
Write-Host "Done. prompts/ files are ready."