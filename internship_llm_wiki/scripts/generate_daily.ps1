[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Source = "",

    [Parameter(Position = 1)]
    [string]$Date = "",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$sourcePaths = @()
if (-not [string]::IsNullOrWhiteSpace($Source)) {
    $sourcePaths += $Source
}

$extraLines = @(
    "Use the selected prompt to generate a daily log from the source note.",
    "Do not create formal wiki notes or update indexes in this step."
)

if (-not [string]::IsNullOrWhiteSpace($Date)) {
    $extraLines += "Requested date: $Date"
}

New-CodexRequest `
    -PromptRelativePath "prompts/02_generate_daily_log.md" `
    -TaskTitle "generate_daily_log" `
    -SourcePaths $sourcePaths `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update the daily log defined by prompts/02_generate_daily_log.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
