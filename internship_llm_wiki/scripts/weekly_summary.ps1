[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]]$Sources = @(),

    [string]$Week = "",

    [string]$DateRange = "",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$extraLines = @(
    "Use the selected prompt to generate a weekly summary from daily logs and related meeting notes.",
    "Do not create formal wiki notes or update indexes in this step."
)

if (-not [string]::IsNullOrWhiteSpace($Week)) {
    $extraLines += "Requested week: $Week"
}

if (-not [string]::IsNullOrWhiteSpace($DateRange)) {
    $extraLines += "Requested date range: $DateRange"
}

New-CodexRequest `
    -PromptRelativePath "prompts/05_generate_weekly_summary.md" `
    -TaskTitle "generate_weekly_summary" `
    -SourcePaths $Sources `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update the weekly summary defined by prompts/05_generate_weekly_summary.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
