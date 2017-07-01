function CodeAuditRD()
{
<#
    .SYNOPSIS
		Function to copy Rubberduck Github release files into a temp directory to find code syntax and validate using search queries.
    .DESCRIPTION
		Function to copy the Github release files into Powershell tempdir object, find code syntax relevant to construct queries.	
    .PARAMETER Tag
		Tag allows which Github Release file of interest are we to extract and report upon.
    .PARAMETER Description
		The version number can only be between the range of 1.4 to 2.1 at present.
    .EXAMPLE
		PS C:\> CodeAuditRD -Tags "v1.4"
    .NOTES
		Written by Peter M Taylor for Rubberduck VBA Project
		Rubberduck VBA Project https://github.com/rubberduck-vba/Rubberduck
    		Script adapted from https://github.com/stadub/PowershellScripts/DownloadGithub.ps1
		Author Webpage https://petermtaylor.github.io/
		Author Twitter @peterlearning24
		Author Github https://github.com/PeterMTaylor
#>     
param(
  [parameter(Mandatory=$true)]
  [string]$Tags)
# Use only Tags which is allows me to select which release number for processing.
#  [string]$githubRepo,
#  [parameter(Mandatory=$true)]
#  [string]$destDir,
#  [string]$installScrip=""
#$SourceLocation="https://github.com/rubberduck-vba/Rubberduck/archive/v2.0.13.zip"
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

if ($Tags) {
return "Correct tag given as $Tags"
}
else {
return "No release version number supplied! Igoring input and stopping execution."
}
}
