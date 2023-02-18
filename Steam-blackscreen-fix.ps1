#Requires -RunAsAdministrator

# Check if steam is running, if yes then close.
$steam = Get-Process steam -ErrorAction SilentlyContinue
if ($steam) {
  # try gracefully first
  $steam.CloseMainWindow()
  # kill after five seconds
  Start-Sleep 5
  if (!$steam.HasExited) {
    $steam | Stop-Process -Force
  }
}
Remove-Variable steam

# Make a backup and stop if not successfull
try 
{
    Copy-Item -Path 'C:\Program Files (x86)\Steam' -Destination 'C:\Temp\Steam-blackscreen-fix' -Recurse -Force -ErrorAction Stop
}
catch 
{
    Write-Host "Could not create a backup"
}
# Delete source
Remove-Item 'C:\Program Files (x86)\Steam*' -Recurse -Force

#Restore files and folders from backup
Copy-Item -Path 'C:\Temp\Steam-blackscreen-fix\Steam\steamapps' -Destination 'C:\Program Files (x86)\Steam' -Recurse -Force
Copy-Item -Path 'C:\Temp\Steam-blackscreen-fix\Steam\userdata' -Destination 'C:\Program Files (x86)\Steam' -Recurse -Force
Copy-Item -Path  'C:\Temp\Steam-blackscreen-fix\Steam\ssfn*' -Destination 'C:\Program Files (x86)\Steam' -Recurse -Force
Copy-Item -Path 'C:\Temp\Steam-blackscreen-fix\Steam\steam.exe' -Destination 'C:\Program Files (x86)\Steam' -Force

# Notify user of completion
Write-Host "Steam has been successfully fixed."