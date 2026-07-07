# ==========================================
# Internship LLM Wiki
# 建立 indexes 空白 Markdown 檔案
# ==========================================

$Root = "."

$IndexDir = Join-Path $Root "indexes"

# 建立資料夾（若不存在）
New-Item -ItemType Directory -Force -Path $IndexDir | Out-Null

# 要建立的 Index 檔案
$Files = @(
    "home.md",
    "learning_index.md",
    "concept_index.md",
    "task_index.md",
    "project_index.md",
    "tool_index.md",
    "workflow_index.md",
    "troubleshooting_index.md",
    "data_index.md",
    "formula_index.md",
    "business_context_index.md",
    "glossary_index.md"
)

foreach ($File in $Files) {

    $Path = Join-Path $IndexDir $File

    if (!(Test-Path $Path)) {
        New-Item -ItemType File -Path $Path | Out-Null
        Write-Host "[Created] $File"
    }
    else {
        Write-Host "[Exists ] $File"
    }
}

Write-Host ""
Write-Host "===================================="
Write-Host "Indexes 建立完成"
Write-Host "===================================="