[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Source = "",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$sourcePaths = @()
if (-not [string]::IsNullOrWhiteSpace($Source)) {
    $sourcePaths += $Source
}

$extraLines = @(
    "Use the selected prompt to import the source note into raw/imported_notes.",
    "Keep the original source content as the source of truth.",
    "Do not create logs, wiki notes, or indexes in this step."
)

New-CodexRequest `
    -PromptRelativePath "prompts/01_import_raw_note.md" `
    -TaskTitle "import_raw_note" `
    -SourcePaths $sourcePaths `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update the raw note location defined by prompts/01_import_raw_note.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
