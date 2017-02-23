function Get-SomeInt
<#
    .SYNOPSIS
        Get-SomeInt is a test. This comment is a test.
    .NOTES
        This is an internal function and should not be called directly.
    .LINK
        This is derived from my work.
    .OUTPUTS
        Does a integer test.
#>
{
    Return Get-Random -Minimum 1 -Maximum 99
}

function CodeAudit
<#
    .SYNOPSIS
        Eventually I would have this done!
    .NOTES
        Looking forward then to make a Powershell RDUtility for checking configurations.
    .LINK
        To rubberduck
    .OUTPUTS
        something like that
#>
{
     Return write-output 'Hello World!' 
}
