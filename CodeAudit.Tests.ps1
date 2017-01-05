$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "CodeAudit as Module" -tag "Module" {

It "does something useful" {
        $true | Should Be $false
    }
}

Describe "Section 1 - Folder selection" -tag "Section 1" {

It "Able to recieve a folder selection" {
         $true | Should Be $false
     }


It "Reject folder selection if none supplied" {
         $true | Should Be $false
     }
}
