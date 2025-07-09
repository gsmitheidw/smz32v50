# Remove software
Uninstall-ChocolateyZipPackage 'smz32v50' 'smz32v50.zip'

# Remove Shortcut
$shortcutPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\smz32v50.lnk"
if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
}

