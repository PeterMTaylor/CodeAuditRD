#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor test script' -ForegroundColor Yellow
Write-Host "Current working directory: $pwd"

#---------------------------------# 
# Run Pester Tests                # 
#---------------------------------# 
$testResultsFile = Join-Path $Env:APPVEYOR_BUILD_FOLDER TestResults.xml
$pesterParms = @@@{
    Script        = "$Env:APPVEYOR_BUILD_FOLDER\test"
    OutputFile    = $testResultsFile
    OutputFormat  = "NUnitXml"
    PassThru      = $true
    Verbose       = $VerbosePreference
}


#$res             = Invoke-Pester -Script .\Tests\CodeAudit.Tests.ps1 -OutputFormat NUnitXml -OutputFile $testResultsFile -PassThru
#$res              = Invoke-Pester -Script .\Tests\CodeAudit.Tests.ps1 -PassThru | Format-Pester -Path $testResultsFile -Format HTML,Word,Text 

#Write-Host 'Uploading results'
#(New-Object 'System.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $testResultsFile))

#---------------------------------# 
# Validate                        # 
#---------------------------------# 
if (($res.FailedCount -gt 0) -or ($res.PassedCount -eq 0)) { 
    throw "$($res.FailedCount) tests failed."
} else {
  Write-Host 'All tests passed' -ForegroundColor Green
}
