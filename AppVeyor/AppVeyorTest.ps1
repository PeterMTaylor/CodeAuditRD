#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor test script' -ForegroundColor Yellow
Write-Host "Current working directory: $pwd"

#---------------------------------# 
# Run Pester Tests                # 
#---------------------------------# 
Invoke-Pester -Script .\CodeAuditRD.Tests.ps1 -OutputFile .\Test-Result.xml -OutputFormat NUnitXml -PassThru | Export-Clixml -Path .\Test-Result.xml
# format pest here!
Write-Host 'Completed Invoke-Pester. Saving results.'
    [xml]$content = Get-Content $testResultsFile
    $content.'test-results'.'test-suite'.type = "Powershell"
    $content.Save($testResultsFile)

Write-Host 'Working with Format-Pester'

if (Test-Path $testResultsFile) {
#  Import-Clixml -Path .\TestsResults.xml | Format-Pester -BaseFileName TestsResults -Format HTML,Word
#Format-Pester -BaseFileName TestsResults -Format HTML,Word
} else {
  Write-Warning ("Testfile {0} not found!" -f $testResultsFile)
      }
      if ($res.FailedCount -gt 0) {
          # Terminate the script to fail the build
          $Error | Format-List * -Force
          exit 1
      }
