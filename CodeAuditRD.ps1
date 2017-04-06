function CodeAuditRD($SourceLocation="https://github.com/rubberduck-vba/Rubberduck/archive/v2.0.13.zip")
{
<#
    .SYNOPSIS
		Function to copy Github repository into a temp directory to find code syntax and validate this on the internet.
	
	.DESCRIPTION
		Function to copy the Github respository into Powershell tempdir object, find code syntax relevant to construct queries.
	
	.PARAMETER Unknown
		Specifies the PowerShell Object
	
	.PARAMETER Property
		Specifies the property to copy. Needs detail later.
	
	.EXAMPLE
		PS C:\> Remove-PSObjectProperty -PSObject $UserInfo -Property Info
	
	.NOTES
		Written by Peter M Taylor for Rubberduck VBA Project
		Rubberduck VBA Project https://github.com/rubberduck-vba/Rubberduck
    		Script adapted from https://github.com/stadub/PowershellScripts/DownloadGithub.ps1
		Personal Webpage https://petermtaylor.github.io/
		Twitter @peterlearning24
		Github github.com/PeterMTaylor
#>
     return "Hello from $SourceLocation"
}
