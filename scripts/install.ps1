param(
  [ValidateSet('auto', 'antigravity', 'magpie', 'dsh', 'claude', 'codex', 'all')]
  [string]$Target = 'auto',
  [string]$Skill = 'all'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$skillsSource = Join-Path $repoRoot 'skills'

$targetMap = [ordered]@{
  antigravity = Join-Path $HOME '.gemini\config\skills'
  magpie      = Join-Path $HOME '.config\magpie\library\skills'
  dsh         = Join-Path $HOME '.dsh\skills'
  claude      = Join-Path $HOME '.claude\skills'
  codex       = Join-Path $HOME '.codex\skills'
}

$selectedTargets = @()
if ($Target -eq 'all') {
  $selectedTargets = $targetMap.Keys
} elseif ($Target -eq 'auto') {
  foreach ($k in @('antigravity', 'magpie', 'dsh')) {
    $parent = Split-Path -Parent $targetMap[$k]
    if (Test-Path $parent) { $selectedTargets += $k }
  }
  if ($selectedTargets.Count -eq 0) { $selectedTargets = @('antigravity') }
} else {
  $selectedTargets = @($Target)
}

$skillDirs = if ($Skill -eq 'all') {
  Get-ChildItem -Path $skillsSource -Directory
} else {
  $single = Join-Path $skillsSource $Skill
  if (-not (Test-Path $single)) {
    throw "Skill '$Skill' not found under $skillsSource"
  }
  @(Get-Item $single)
}

foreach ($t in $selectedTargets) {
  $destRoot = $targetMap[$t]
  New-Item -ItemType Directory -Force -Path $destRoot | Out-Null
  foreach ($s in $skillDirs) {
    $dest = Join-Path $destRoot $s.Name
    if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
    Copy-Item -Path $s.FullName -Destination $dest -Recurse -Force
    Write-Host "[OK] Installed $($s.Name) -> $dest"
  }
}
