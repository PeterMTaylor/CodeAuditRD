#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor test script' -ForegroundColor Yellow
Write-Host "Current working directory: $pwd"

#---------------------------------# 
# Run Pester Tests                # 
#---------------------------------# 
$testResultsFile = Join-Path $Env:APPVEYOR_BUILD_FOLDER TestResults.xml
$pesterParams = @{
    Script        = "$Env:APPVEYOR_BUILD_FOLDER\test"
    OutputFile    = $testResultsFile
    OutputFormat  = "NUnitXml"
    PassThru      = $true
    Verbose       = $VerbosePreference
}
Import-Module Pester
(get-module pester).version.ToString()
$res = Invoke-Pester @pesterParams
[xml]$content = Get-Content $testResultsFile
$content.'test-results'.'test-suite'.type = "Powershell"
$content.Save($testResultsFile)

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