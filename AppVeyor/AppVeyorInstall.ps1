#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor install script' -ForegroundColor Yellow

#---------------------------------#
# Powershell status               #
#---------------------------------#
Write-Host "Installed Powershell '$PSVersionTable'"

#---------------------------------# 
# Install NuGet                   # 
#---------------------------------# 
Write-Host 'Installing NuGet PackageProvide'
$pkg = Install-PackageProvider -Name NuGet -Force
Write-Host "Installed NuGet version '$($pkg.version)'" 

#---------------------------------# 
# Install Pester                  # 
#---------------------------------# 
Write-Host 'Installing Pester'
Install-Module -Name Pester -Repository PSGallery -Force
Get-Module -ListAvailable -Name Pester | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Pscribo                #
#---------------------------------#
Write-Host 'Installing PScribo'
Install-Module -Name PScribo -Repository PSGallery -Force -SkipPublisherCheck
Get-Module -ListAvailable -Name PScribo | Format-List Name,Version,ModuleBase

#---------------------------------#
#  Install Format-Pester          #
#---------------------------------#
Write-Host 'Installing Format-Pester'
Install-Module -Name Format-Pester -Force
Get-Module -ListAvailable -Name Format-Pester | Format-List Name,Version,ModuleBase

#---------------------------------# 
# Install PSScriptAnalyzer        # 
#---------------------------------# 
Write-Host 'Installing PSScriptAnalyzer'
Install-Module PSScriptAnalyzer -Repository PSGallery -force
Get-Module -ListAvailable -Name PSScriptAnalyzer | Format-List Name,Version,ModuleBase
