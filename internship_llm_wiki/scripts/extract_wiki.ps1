[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]]$Sources = @(),

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$extraLines = @(
    "Use the selected prompt to extract formal wiki notes from the provided log files.",
    "Create or update wiki notes only when the source supports them.",
    "Do not update indexes in this step."
)

New-CodexRequest `
    -PromptRelativePath "prompts/03_extract_wiki_notes.md" `
    -TaskTitle "extract_wiki_notes" `
    -SourcePaths $Sources `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Create or update wiki notes according to prompts/03_extract_wiki_notes.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
