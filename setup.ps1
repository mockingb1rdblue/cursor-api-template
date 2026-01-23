<#
.SYNOPSIS
    setup.ps1 - Initialize a project with the Cline Two-Role Agent Template
.DESCRIPTION
    Usage: .\setup.ps1 [project_directory]
#>

param (
    [string]$TargetDir = "."
)

$RepoRawUrl = "https://raw.githubusercontent.com/mockingb1rdblue/cursor-api-template/main"

Write-Host "🚀 Initializing Cline Template in: $TargetDir" -ForegroundColor Cyan

# Ensure target directory exists
if (!(Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

$CurrentDir = Get-Location
$Files = @(".clinerules", "AI_COLLABORATION_PROTOCOL.md", "CHANGELOG.md", "status.md")

foreach ($file in $Files) {
    $DestPath = Join-Path $TargetDir $file
    $SrcPath = Join-Path $CurrentDir $file
    
    if (!(Test-Path $DestPath)) {
        if (Test-Path $SrcPath) {
            Write-Host "📄 Copying $file from local source..."
            Copy-Item -Path $SrcPath -Destination $DestPath
        } else {
            Write-Host "🌐 Downloading $file from GitHub..."
            try {
                Invoke-WebRequest -Uri "$RepoRawUrl/$file" -OutFile $DestPath -UseBasicParsing
            } catch {
                Write-Host "❌ Failed to download $file" -ForegroundColor Red
            }
        }
    } else {
        Write-Host "⚠️  $file already exists, skipping." -ForegroundColor Yellow
    }
}

# Initialize status.md if it was just created or is empty
$StatusPath = Join-Path $TargetDir "status.md"
if ((Test-Path $StatusPath) -and (Get-Item $StatusPath).Length -gt 0) {
    Write-Host "✅ status.md is ready." -ForegroundColor Green
} else {
    $StatusContent = @"
# Project Status

**Phase:** Plan | Build | Debug
**Planner Model:** DeepSeek Reasoning
**Actor Model:** Gemini Flash 3

## Current Goal
Initial project setup and verification.

## Plan (from DeepSeek)
1. Initialize repository and template files.
2. Verify .clinerules enforcement.
3. Establish baseline project structure.

## Work Done (by Gemini)
- [x] Ran setup.ps1 script.
- [x] Verified template file presence.

## Open Problems
- None.

## Next Actions
- Define the project's primary objectives.
"@
    Set-Content -Path $StatusPath -Value $StatusContent
}

Write-Host "✨ Setup complete! You can now start a new task in Cline using the PLANNER role (DeepSeek)." -ForegroundColor Green