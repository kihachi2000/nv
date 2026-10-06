$ErrorActionPreference = "Stop"

$imageRepository = "ghcr.io/kihachi2000/neovim-container"
$imageTag = if ($env:NVIM_CONTAINER_TAG) { $env:NVIM_CONTAINER_TAG } else { "latest" }
$image = if ($env:NVIM_CONTAINER_IMAGE) {
    $env:NVIM_CONTAINER_IMAGE
} else {
    "${imageRepository}:${imageTag}"
}

$dockerOptions = @(
    "run"
    "--rm"
    "-v"
    "$($PWD.Path):/workspace"
    "-w"
    "/workspace"
)

if (-not [Console]::IsInputRedirected -and -not [Console]::IsOutputRedirected) {
    $dockerOptions += "-it"
}

& wslc.exe @dockerOptions $image @args
exit $LASTEXITCODE
