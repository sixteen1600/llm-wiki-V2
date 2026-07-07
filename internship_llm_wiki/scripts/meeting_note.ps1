[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Source = "",

    [string]$Date = "",

    [string]$Topic = "",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$sourcePaths = @()
if (-not [string]::IsNullOrWhiteSpace($Source)) {
    $sourcePaths += $Source
}

$extraLines = @(
    "Use the selected prompt to process a meeting note into logs/meetings.",
    "Do not create formal wiki notes or update indexes in this step.",
    "Apply sensitive information rules before copying any details into the meeting note."
)

if (-not [string]::IsNullOrWhiteSpace($Date)) {
    $extraLines += "Requested meeting date: $Date"
}

if (-not [string]::IsNullOrWhiteSpace($Topic)) {
    $extraLines += "Requested meeting topic: $Topic"
}

New-CodexRequest `
    -PromptRelativePath "prompts/07_process_meeting_note.md" `
    -TaskTitle "process_meeting_note" `
    -SourcePaths $sourcePaths `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update the meeting note defined by prompts/07_process_meeting_note.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
