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
#param(
#  [parameter(Mandatory=$true)]
#  [string]$githubRepo,
#  [parameter(Mandatory=$true)]
#  [string]$destDir,
#  [string]$installScrip=""
#)
#$githubUriRegex="(?<Scheme>https://)(?<Host>github.com)/(?<User>\w*)/(?<Repo>\w*)(/archive/(?<Branch>master).zip)?"
#
#$githubMatch = [regex]::Match($githubRepo,$githubUriRegex)
#
#function GetGroupValue($match, [string]$group, [string]$default=""){
#	$val=$match.Groups[$group].Value
#	Write-Debug $val
#	if($val){
#		return $val
#	}
#	return $default
#}

#if( ! $(GetGroupValue $githubMatch "Host") ){
#	throw [System.ArgumentException] "Incorrect 'Host' value. The 'github.com' domain expected"
#	#Write-Error -Message "Incorrect 'Host' value. The 'github.com' domain expected" -Category InvalidArgument
#}

#Because url can be in different formats 
#$githubUrl='https://github.com/{0}/{1}/archive/{2}.zip' -f 
#						$(GetGroupValue $githubMatch "User"),
#						$(GetGroupValue $githubMatch "Repo"), 
#						$(GetGroupValue $githubMatch "Branch" "master")


#$file = [System.IO.Path]::GetTempFileName() + ".zip"

#New-Object System.Net.WebClient|%{$_.DownloadFile($githubUrl,$file);}
#$sh = New-Object -ComObject Shell.Application

#$archive=$sh.NameSpace($file).Items();

#archive contain root folder. So get folder content
#$archiveFilder=$archive.Item(0).GetFolder.Items()

#if ( -Not $(Test-Path -path $destDir)){
#	mkdir $destDir
#}
#else{
#	Write-Warning "'$destDir' already exists."  -warningaction Inquire
#}

#$dst=$sh.NameSpace($destDir)
#$dst.CopyHere($archiveFilder, 272)

#if( $installScrip ){
#	if ( Test-Path -path $destDir\$installScrip){
#		&  $destDir\$installScrip
#	}
#	else{
#		Write-Warning "Installer script is not found."
#	}
#}
