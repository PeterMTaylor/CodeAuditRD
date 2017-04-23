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
#$pkg = Install-PackageProvider -Name NuGet -Force
#Write-Host "Installed NuGet version '$($pkg.version)'" 
choco install NuGet
Get-Module -ListAvailable -Name NuGet | Format-List Name,Version,ModuleBase

#---------------------------------# 
# Install Pester                  # 
#---------------------------------# 
Write-Host 'Installing Pester'
#Install-Module -Name Pester -Repository PSGallery -Force
#Install-Module -Name Pester -SkipPublisherCheck
#Install-Module -Name Pester
#attempt to get verison greater than 3.4.0
#Install-Module -Name Pester -Force
#use chocoleaty installtion
choco upgrade Pester
Get-Module -ListAvailable -Name Pester | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Pscribo                #
#---------------------------------#
Write-Host 'Installing PScribo'
#Install-Module -Name PScribo -Repository PSGallery -Force
Install-Module -Name PScribo
Get-Module -ListAvailable -Name PScribo | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Format-Pester         #
#---------------------------------#
Write-Host 'Installing Format-Pester'
#Install-Module -Name Format-Pester -Force
Install-Module -Name Format-Pester
Get-Module -ListAvailable -Name Format-Pester | Format-List Name,Version,ModuleBase

#---------------------------------# 
# Install PSScriptAnalyzer        # 
#---------------------------------# 
Write-Host 'Installing PSScriptAnalyzer'
Install-Module PSScriptAnalyzer -Repository PSGallery -force
Get-Module -ListAvailable -Name PSScriptAnalyzer | Format-List Name,Version,ModuleBase
