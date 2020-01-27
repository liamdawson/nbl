Disable-UAC

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

cinst firefox
cinst "1password"

AppList = @('*Disney*', '*king.com*', '*HiddenCity*', '*DolbyLaboratories*', '*Microsoft.MicrosoftOfficeHub*', '*Microsoft.BingNews*', '*getstarted*', '*gethelp*', '*bingfinance*', '*sports*', '*adobe*', '*facebook*', '*bethesda*', '*farmville*');
foreach ($App in $AppList) { Get-AppxPackage -Name $App | Remove-AppxPackage }

Enable-UAC
