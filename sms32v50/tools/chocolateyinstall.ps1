$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.softwareforeducation.com/sms32v50/smz32v50.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'smz32v50*' 
  checksum      = '133EA866CAEF9AA98D614954FBF925918E675DF4ED1F6DF98E487B89D15A9F14'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs

$target = Join-Path $toolsDir "Digital\$($packageName).exe"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\smz32v50.lnk" -targetPath $target 

# We cannot set a specific dependency for Java Runtime as Oracle JRE, JDK and OpenJDK etc are all possible alternatives
# In light of this, warn the user:
Write-Warning "Note: a valid Java Runtime is required such as jre or equivavlent"
