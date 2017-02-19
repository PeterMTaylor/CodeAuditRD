#---------------------------------# 
# PSScriptAnalyzer tests          # 
#---------------------------------# 
$Scripts = Get-ChildItem "$PSScriptRoot\..\" -Filter '*.ps1' -Recurse | Where-Object {$_.name -NotMatch 'Tests.ps1'}
$Modules = Get-ChildItem "$PSScriptRoot\..\" -Filter '*.psm1' -Recurse
$Rules   = Get-ScriptAnalyzerRule

if ($Modules.count -gt 0) {
  Describe 'Testing all Modules against default PSScriptAnalyzer rule-set' {
    foreach ($module in $modules) {
      Context "Testing Module '$($module.FullName)'" {
        foreach ($rule in $rules) {
          It "passes the PSScriptAnalyzer Rule $rule" {
            (Invoke-ScriptAnalyzer -Path $module.FullName -IncludeRule $rule.RuleName ).Count | Should Be 0
          }
        }
      }
    }
  }
}
if ($Scripts.count -gt 0) {
  Describe 'Testing all Script against default PSScriptAnalyzer rule-set' {
    foreach ($Script in $scripts) {
      Context "Testing Script '$($script.FullName)'" {
        foreach ($rule in $rules) {
          It "passes the PSScriptAnalyzer Rule $rule" {
            if (-not ($module.BaseName -match 'AppVeyor') -and -not ($rule.Rulename -eq 'PSAvoidUsingWriteHost') ) {
              (Invoke-ScriptAnalyzer -Path $script.FullName -IncludeRule $rule.RuleName ).Count | Should Be 0
            }
          }
        }
      }
    }
  }
}

#-------------------------# 
# CodeAudit Pester tests  # 
#-------------------------# 

$moduleName = 'CodeAudit';
if (!$PSScriptRoot) { # $PSScriptRoot is not defined in 2.0
    $PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}
$repoRoot = (Resolve-Path $PSScriptRoot).Path;

Import-Module (Join-Path -Path $RepoRoot -ChildPath "$moduleName.psm1") -Force;

Describe $moduleName {   
    #Need code to read the script to check 
    It 'Always have functions documented' -Pending {
       CodeAudit | Should Be 'Hello World!'
    }
    #Show that what happens here in appveyor works on PC
    It 'Prove that this change works on the desktop as I do here testing in Appveyor' -Pending
    { 
        CodeAudit | Should Be 'Hello World!'
    }
    
    #Learn more about local data and accessing them during test 
    It 'Obtain the Github release location via localpassed variable' -Pending
    { 
        CodeAudit | Should Be 'Hello World!'
    }
    
    #Learn how Testdrive works
    It 'Fetch the file from Github release location into Testdrive' -Pending
    { 
        CodeAudit | Should Be 'Hello World!'
    }
    
    #check if the zip file algorithm from IainRobertson works.
    It 'Start processing the release file opening up the zip file' {    
    }
    
    Context 'Strict mode' { 
        Set-StrictMode -Version latest

        It 'Get-SomeInt should return int' {
          Get-SomeInt | Should BeOfType System.Int32
        }     
    }

    Context "CodeAudit" {
    It "CodeAudit displays HelloWorld" {
        CodeAudit | Should Be 'Hello World!'

        }
    }  
} #End Describe
