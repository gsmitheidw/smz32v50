$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Original location
# http://www.softwareforeducation.com/sms32v50/smz32v50.zip
$file        = "$toolsDir\smz32v50.zip"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $file
  softwareName  = 'smz32v50*' 
  checksum      = '133EA866CAEF9AA98D614954FBF925918E675DF4ED1F6DF98E487B89D15A9F14'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs

# Note spelling of binary is sms32v50 not smz32v50 here:
$target = Join-Path $toolsDir "sms32v50.exe"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\smz32v50.lnk" -targetPath $target 

