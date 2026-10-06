$ErrorActionPreference = "Stop"

$baseImage = "ghcr.io/kihachi2000/neovim-container"

if ($args.Count -gt 0 -and ($args[0] -eq "-h" -or $args[0] -eq "--help")) {
    $usage = @"
Usage: nv-update.ps1 [<version-tag>]

Pull the neovim-container image. If no version tag is given, pulls "latest".

Examples:
  nv-update.ps1              # pulls ghcr.io/kihachi2000/neovim-container:latest
  nv-update.ps1 v26.08.31   # pulls ghcr.io/kihachi2000/neovim-container:v26.08.31
"@
    [Console]::Error.WriteLine($usage)
    exit 0
}

if ($args.Count -gt 0 -and $args[0].StartsWith("-")) {
    [Console]::Error.WriteLine("Unknown option: $($args[0])")
    exit 1
}

$tag = if ($args.Count -gt 0) { $args[0] } else { "latest" }
$image = "${baseImage}:${tag}"

Write-Output "Pulling $image ..."
& wslc.exe pull $image
exit $LASTEXITCODE
