# oh-my-posh init pwsh --config D:\M365Princess.omp.json | Invoke-Expression
Invoke-Expression (&starship init powershell)
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Emacs

function yy
{
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path)
    {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
