[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]]$Sources = @(),

    [string]$Month = "",

    [string]$DateRange = "",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$extraLines = @(
    "Use the selected prompt to generate a monthly review from weekly summaries and related logs.",
    "Do not create formal wiki notes or update indexes in this step."
)

if (-not [string]::IsNullOrWhiteSpace($Month)) {
    $extraLines += "Requested month: $Month"
}

if (-not [string]::IsNullOrWhiteSpace($DateRange)) {
    $extraLines += "Requested date range: $DateRange"
}

New-CodexRequest `
    -PromptRelativePath "prompts/06_generate_monthly_review.md" `
    -TaskTitle "generate_monthly_review" `
    -SourcePaths $Sources `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update the monthly review defined by prompts/06_generate_monthly_review.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
