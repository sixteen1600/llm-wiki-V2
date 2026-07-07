Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-ProjectRoot {
    $scriptDir = $PSScriptRoot
    if ([string]::IsNullOrWhiteSpace($scriptDir)) {
        $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    }
    $root = Split-Path -Parent $scriptDir
    return (Resolve-Path -LiteralPath $root).Path
}

function Assert-ProjectRoot {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectRoot
    )

    $promptsPath = Join-Path $ProjectRoot "prompts"
    $scriptsPath = Join-Path $ProjectRoot "scripts"

    if (-not (Test-Path -LiteralPath $promptsPath -PathType Container)) {
        throw "Project root check failed. Missing prompts folder: $promptsPath"
    }

    if (-not (Test-Path -LiteralPath $scriptsPath -PathType Container)) {
        throw "Project root check failed. Missing scripts folder: $scriptsPath"
    }
}

function Resolve-ProjectPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectRoot,

        [Parameter(Mandatory = $true)]
        [string]$InputPath
    )

    if ([System.IO.Path]::IsPathRooted($InputPath)) {
        return $InputPath
    }

    return (Join-Path $ProjectRoot $InputPath)
}

function Get-RelativePathSafe {
    param(
        [Parameter(Mandatory = $true)]
        [string]$BasePath,

        [Parameter(Mandatory = $true)]
        [string]$TargetPath
    )

    try {
        $resolvedBase = (Resolve-Path -LiteralPath $BasePath).Path
        $resolvedTarget = (Resolve-Path -LiteralPath $TargetPath).Path

        if (-not $resolvedBase.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
            $resolvedBase = $resolvedBase + [System.IO.Path]::DirectorySeparatorChar
        }

        $baseUri = New-Object System.Uri($resolvedBase)
        $targetUri = New-Object System.Uri($resolvedTarget)
        $relativeUri = $baseUri.MakeRelativeUri($targetUri).ToString()
        $relativePath = [System.Uri]::UnescapeDataString($relativeUri)
        return $relativePath.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
    }
    catch {
        return $TargetPath
    }
}

function Format-SourceList {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectRoot,

        [string[]]$SourcePaths = @()
    )

    $lines = New-Object System.Collections.Generic.List[string]

    foreach ($source in $SourcePaths) {
        if ([string]::IsNullOrWhiteSpace($source)) {
            continue
        }

        $fullPath = Resolve-ProjectPath -ProjectRoot $ProjectRoot -InputPath $source

        if (Test-Path -LiteralPath $fullPath) {
            $relative = Get-RelativePathSafe -BasePath $ProjectRoot -TargetPath $fullPath
            $lines.Add("- $relative")
        }
        else {
            $lines.Add("- $source (not found yet or needs review)")
        }
    }

    if ($lines.Count -eq 0) {
        return "- none provided"
    }

    return ($lines -join [Environment]::NewLine)
}

function New-CodexRequest {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PromptRelativePath,

        [Parameter(Mandatory = $true)]
        [string]$TaskTitle,

        [string[]]$SourcePaths = @(),

        [string]$ExtraInstructions = "",

        [string]$OutputHint = "",

        [switch]$NoClipboard,

        [switch]$Open
    )

    $projectRoot = Get-ProjectRoot
    Assert-ProjectRoot -ProjectRoot $projectRoot

    $promptPath = Join-Path $projectRoot $PromptRelativePath
    if (-not (Test-Path -LiteralPath $promptPath -PathType Leaf)) {
        throw "Prompt file not found: $promptPath"
    }

    $promptText = Get-Content -LiteralPath $promptPath -Raw -Encoding UTF8
    $sourceText = Format-SourceList -ProjectRoot $projectRoot -SourcePaths $SourcePaths

    if ([string]::IsNullOrWhiteSpace($ExtraInstructions)) {
        $ExtraInstructions = "Follow the selected prompt exactly."
    }

    if ([string]::IsNullOrWhiteSpace($OutputHint)) {
        $OutputHint = "Follow the output rules defined in the selected prompt."
    }

    $requestDir = Join-Path $projectRoot ".codex_requests"
    if (-not (Test-Path -LiteralPath $requestDir -PathType Container)) {
        New-Item -ItemType Directory -Path $requestDir -Force | Out-Null
    }

    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $safeTitle = ($TaskTitle -replace '[^A-Za-z0-9_-]', '_').Trim('_')
    if ([string]::IsNullOrWhiteSpace($safeTitle)) {
        $safeTitle = "codex_request"
    }

    $requestName = $timestamp + "_" + $safeTitle + ".md"
    $requestPath = Join-Path $requestDir $requestName

    $requestText = @"
# Codex Request: $TaskTitle

## Prompt file
$PromptRelativePath

## Source paths
$sourceText

## Expected output
$OutputHint

## Extra instructions
$ExtraInstructions

## Prompt content

~~~markdown
$promptText
~~~
"@

    Set-Content -LiteralPath $requestPath -Value $requestText -Encoding UTF8

    if (-not $NoClipboard) {
        try {
            Set-Clipboard -Value $requestText
            Write-Host "Copied request content to clipboard."
        }
        catch {
            Write-Warning "Could not copy request content to clipboard. The request file was still created."
        }
    }

    if ($Open) {
        Invoke-Item -LiteralPath $requestPath
    }

    Write-Host "Created request file: $requestPath"
    return $requestPath
}
