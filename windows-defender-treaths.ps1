function Get-Past-treaths {
  Get-MpThreat | Out-File "C:\Users\ferdi\Downloads\windows.defnder.txt"
  }

function Get-Admin {
  $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
  ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

  if (-not $isAdmin) {
	  Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList @(
		"-NoProfile -File `"$PSCommandPath`""
	)
	exit
}
