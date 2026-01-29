param(
    [switch]$Force
)

$repoRoot = Get-Location
$siteDir = Join-Path $repoRoot 'site'

if (-not (Get-Command mkdocs -ErrorAction SilentlyContinue)) {
    Write-Error "mkdocs não encontrado. Instale com: pip install mkdocs mkdocs-material"
    exit 1
}

# Build site
mkdocs build

$deployDir = Join-Path $repoRoot '.deploy_tmp'
if (Test-Path $deployDir) { Remove-Item -Recurse -Force $deployDir }
New-Item -ItemType Directory -Path $deployDir | Out-Null

$remote = git -C $repoRoot remote get-url origin

Push-Location $deployDir
git init | Out-Null
git remote add origin $remote
git checkout -B gh-pages

Copy-Item -Path (Join-Path $siteDir '*') -Destination $deployDir -Recurse -Force
git add --all
if (-not $Force) {
    git commit -m "Deploy MkDocs site" | Out-Null
} else {
    git commit -m "Deploy MkDocs site" --allow-empty | Out-Null
}
git push -f $remote gh-pages

Pop-Location
Remove-Item -Recurse -Force $deployDir

Write-Host "Deploy concluído (branch gh-pages atualizada)." -ForegroundColor Green
