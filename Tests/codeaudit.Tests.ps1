$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "codeaudit" {
    It "CodeAudit displays CodeAudit" {
        CodeAudit | Should Be 'CodeAudit'
        }
    It "CODEAUDIT DOES REPORT SOMETHING-" {
        codeaudit | SHOULD BE 'SOMETHING'
  }
}
