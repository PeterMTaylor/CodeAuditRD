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
          } #End It Passes?
        } #End For Each Rule
      } #End Context Test Module
    } #End For each Modules
  } #End Describe
} #End if Modules

if ($Scripts.count -gt 0) {
  Describe 'Testing all Script against default PSScriptAnalyzer rule-set' {
    foreach ($Script in $scripts) {
      Context "Testing Script '$($script.FullName)'" {
        foreach ($rule in $rules) {
          It "passes the PSScriptAnalyzer Rule $rule" {
            if (-not ($module.BaseName -match 'AppVeyor') -and -not ($rule.Rulename -eq 'PSAvoidUsingWriteHost') ) {
              (Invoke-ScriptAnalyzer -Path $script.FullName -IncludeRule $rule.RuleName ).Count | Should Be 0
            } #End if Passes?
          } #End it passes PSScriptAnalyser
        } #End For each rule
      } #End Context Test Script
    } #End For each Script
  } #End Describe
} #End if Scripts

#---------------------------# 
# CodeAuditRD Pester tests  # 
#---------------------------# 
$moduleName = 'CodeAuditRD';
if (!$PSScriptRoot) { # $PSScriptRoot is not defined in 2.0
    $PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}
$repoRoot = (Resolve-Path $PSScriptRoot).Path;

Import-Module (Join-Path -Path $RepoRoot -ChildPath "$moduleName.psm1") -Force;

Describe $moduleName {   
    $FunctionsList = (get-command -Module $moduleName | Where-Object -FilterScript { $_.CommandType -eq 'Function' }).Name
    
    FOREACH ($Function in $FunctionsList)
    {
        # Retrieve the Help of the function
        $Help = Get-Help -Name $Function -Full
        
        $Notes = ($Help.alertSet.alert.text -split '\n')
        # Parse the function using AST
        $AST = [System.Management.Automation.Language.Parser]::ParseInput((Get-Content function:$Function), [ref]$null, [ref]$null)    
        
        Context "$Function - Help" {
            It "Synopsis" { $help.Synopsis | Should not BeNullOrEmpty }
            It "Description" { $help.Description | Should not BeNullOrEmpty }
            It "Notes - Author" { $Notes[0].trim() | Should Be "Written by Peter M Taylor for Rubberduck VBA Project" }
            It "Notes - About RubberduckVBA" { $Notes[1].trim() | Should Be "Rubberduck VBA Project https://github.com/rubberduck-vba/Rubberduck" }
            It "Notes - Script Adapted" { $Notes[2].trim() | Should Be "Script adapted from https://github.com/stadub/PowershellScripts/DownloadGithub.ps1" }
            It "Notes - Personal Website" { $Notes[3].trim() | Should Be "Author Webpage https://petermtaylor.github.io/" }
            It "Notes - Personal Twitter" { $Notes[4].trim() | Should Be "Author Twitter @peterlearning24" }
            It "Notes - Personal Github" { $Notes[5].trim() | Should Be "Author Github https://github.com/PeterMTaylor" }
            
            # Get the parameters declared in the Comment Based Help
            $RiskMitigationParameters = 'Whatif', 'Confirm'
            $HelpParameters = $help.parameters.parameter | Where-Object name -NotIn $RiskMitigationParameters
            
            # Get the parameters declared in the AST PARAM() Block
            $ASTParameters = $ast.ParamBlock.Parameters.Name.variablepath.userpath
            
            $FunctionsList = (get-command -Module $ModuleName | Where-Object -FilterScript { $_.CommandType -eq 'Function' }).Name 
            
            It "Parameter - Compare Count Help/AST" {
                $HelpParameters.name.count -eq $ASTParameters.count | Should Be $true
            } # end parameter
            
            # Parameter Description
            If (-not [String]::IsNullOrEmpty($ASTParameters)) # IF ASTParameters are found
            {
                $HelpParameters | ForEach-Object {
                    It "Parameter $($_.Name) - Should contains description" {
                        $_.description | Should not BeNullOrEmpty
                    } # end foreach-object
                }  # End helpParameters
                
            } # end IsNullOrEmpty $ASTParameters
            
            # Examples
            it "Example - Count should be greater than 0" {
                $Help.examples.example.code.count | Should BeGreaterthan 0
            }
            
            # Examples - Remarks (small description that comes with the example)
            foreach ($Example in $Help.examples.example) {
                it "Example - Remarks on $($Example.Title)" {
                    $Example.remarks | Should not BeNullOrEmpty
                } # End Example Remarks
            } # End foreach remarks
          } # end context function help
        } # end for each function within Describe block
        
      Context "$Function - Returns a result " {
          It "does something useful with just $Function function name" {
            $true | Should Be $true
          }
      }

      Context "$Function - Returns with no input " {
        It "with no input given throws a Mandatory value expected result" {
           {CodeAuditRD} | Should Throw
        }
      }
      
      Context "$Function - Returns some output" {
          It "with a name returns the standard phrase with that name" {
              CodeAuditRD "Venus" | Should Be "Hello from Venus"
          }
          It "with a name returns something that ends with name" {
              CodeAuditRD "Mars" | Should Match ".*Mars"
          }
      }

    Context "$Function - Zip file functionality" {
          It "received zipped file" {
          }
          It "extracted zip file into Testdir successfully" {
          }
          It "cleaned up  zip file after use" {
          }
    }

    Context "$Function - Version control detection" {
          it "how can i find the latest verison" {
          }
          it "applies tags " {
          }
          it "applies all or some mixed tags that i recognise" {
          }
    }
} #End Describe
