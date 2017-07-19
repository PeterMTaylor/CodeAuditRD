#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor install script' -ForegroundColor Yellow

#---------------------------------#
# Powershell status               #
#---------------------------------#
Write-Host "Installed Powershell PSVersion: $($PSVersionTable.PSVersion), build: $($PSVersionTable.BuildVersion), clr version: $($PSVersionTable.ClrVersion)"
Write-Host "Host name: $($Host.Name)"

#---------------------------------# 
# Install NuGet                   # 
#---------------------------------# 
Write-Host 'Installing NuGet PackageProvide'
choco install NuGet
#Install-PackageProvider -Name NuGet -Force
Get-Module -ListAvailable -Name NuGet | Format-List Name,Version,ModuleBase

#---------------------------------# 
# Install Pester                  # 
#---------------------------------# 
Write-Host 'Installing Pester'
choco install Pester
Get-Module -ListAvailable -Name Pester | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Pscribo                #
#---------------------------------#
Write-Host 'Installing PScribo'
Install-Module -Name PScribo -Repository PSGallery -Force
#Install-Module -Name PScribo
Get-Module -ListAvailable -Name PScribo | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Format-Pester         #
#---------------------------------#
Write-Host 'Installing Format-Pester'
Install-Module -Name Format-Pester -Repository PSGallery -Force
Get-Module -ListAvailable -Name Format-Pester | Format-List Name,Version,ModuleBase

#---------------------------------# 
# Install PSScriptAnalyzer        # 
#---------------------------------# 
Write-Host 'Installing PSScriptAnalyzer'
Install-Module PSScriptAnalyzer -Repository PSGallery -force
Get-Module -ListAvailable -Name PSScriptAnalyzer | Format-List Name,Version,ModuleBase
