[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]]$Sources = @(),

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$extraLines = @(
    "Use the selected prompt to update indexes based on existing or newly updated wiki notes.",
    "Do not create new wiki notes in this step.",
    "Do not create extra index files outside the fixed index structure."
)

New-CodexRequest `
    -PromptRelativePath "prompts/04_update_indexes.md" `
    -TaskTitle "update_indexes" `
    -SourcePaths $Sources `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Update indexes according to prompts/04_update_indexes.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
