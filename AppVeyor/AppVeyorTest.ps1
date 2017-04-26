#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor test script' -ForegroundColor Yellow
Write-Host "Current working directory: $pwd"

#---------------------------------# 
# Run Pester Tests                # 
#---------------------------------# 
$testResultsFile = '.\TestsResults.xml'
$res             = Invoke-Pester -Script .\CodeAuditRD.Tests.ps1 -OutputFile $testResultsFile -OutputFormat NUnitXml

Write-Host 'Completed Invoke-Pester. Saving results.'
    [xml]$content = Get-Content $testResultsFile
    $content.'test-results'.'test-suite'.type = "Powershell"
    $content.Save($testResultsFile)

Write-Host 'Uploading results'
#(New-Object 'System.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $testResultsFile))

if (Test-Path $testResultsFile) {
    (New-Object 'Systems.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$(env:APPVEYOR_JOB_ID)", $testResultsFile)
} else {
  Write-Warning ("Testfile {0} not found!" -f $testResultsFile)
      }
      if ($res.FailedCount -gt 0) {
          # Terminate the script to fail the build
          $Error | Format-List * -Force
          exit 1
      }
