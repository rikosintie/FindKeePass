#enumerate a list of drives on the computer - Includes network shares.
$Drives = Get-PSDrive -PSProvider FileSystem | Select-Object -expandproperty  Root
#
#build directory that script was executed from so that kdbs can be copied
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
#
#create a filename to save the kdb locations to
$FileName = $scriptDir + "\kdb.txt"
#
#check for an existing kdb.txt file in the directory and delete if it exists
Remove-Item $FileName -ErrorAction SilentlyContinue
write-host ""
write-host "The script was executed from $scriptDir"
write-host ""
Write-Host "The following drives were found on this computer $Drives"
Write-Host ""
#
#loop through the array of drives and search for kdb files
foreach ($drive in $Drives) {
 Write-Host "[================]"
 Write-Host "   Searching $Drive"
 Write-Host "[================]"
 Get-ChildItem -Path $drive -Include @("*kee*.exe", "*.kdb*") -Recurse -ErrorAction SilentlyContinue | Select-Object -Expand FullName | Add-Content $FileName -PassThru | FL 
  write-host ""
 }
 #
 #read the list of kdb files and copy each one to the folder where the script was executed.
 Get-Content $FileName | foreach-object {Copy-Item $_ $scriptDir -force -ErrorAction SilentlyContinue}
#
 write-host "Finished" 
