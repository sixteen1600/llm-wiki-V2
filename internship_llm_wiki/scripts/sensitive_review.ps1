[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]]$Targets = @(),

    [ValidateSet("ReviewOnly", "ReviewAndPatch")]
    [string]$Mode = "ReviewOnly",

    [switch]$NoClipboard,

    [switch]$Open
)

. (Join-Path $PSScriptRoot "_shared.ps1")

$extraLines = @(
    "Use the selected prompt to review sensitive information in the provided targets.",
    "Do not copy sensitive content into the final response.",
    "Review mode: $Mode"
)

New-CodexRequest `
    -PromptRelativePath "prompts/08_sensitive_info_review.md" `
    -TaskTitle "sensitive_info_review" `
    -SourcePaths $Targets `
    -ExtraInstructions ($extraLines -join [Environment]::NewLine) `
    -OutputHint "Review or patch sensitive information according to prompts/08_sensitive_info_review.md." `
    -NoClipboard:$NoClipboard `
    -Open:$Open
