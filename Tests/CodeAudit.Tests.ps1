$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "CodeAudit" {
    It "CodeAudit displays HelloWorld" {
        CodeAudit | Should Be 'Hello World!'

    }
}