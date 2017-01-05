$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "CodeAudit as Module" -tag "Module" {

It "does something useful" {
        $true | Should Be $false
    }
}
