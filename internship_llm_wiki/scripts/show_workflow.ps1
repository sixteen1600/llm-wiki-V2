[CmdletBinding()]
param()

$workflow = @(
    "1. import_note.ps1",
    "2. sensitive_review.ps1",
    "",
    "Choose one of the following:",
    "",
    "3A. generate_daily.ps1",
    "    -> For normal learning notes.",
    "",
    "3B. meeting_note.ps1",
    "    -> For meeting notes.",
    "",
    "Then continue with:",
    "",
    "4. extract_wiki.ps1",
    "5. update_indexes.ps1",
    "6. weekly_summary.ps1",
    "7. monthly_review.ps1"
)

Write-Host "Recommended workflow:"
foreach ($item in $workflow) {
    Write-Host $item
}
