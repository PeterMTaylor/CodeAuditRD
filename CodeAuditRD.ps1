function CodeAuditRD()
{
<#
    .SYNOPSIS
		Function to copy Rubberduck Github release files into a temp directory to find code syntax and validate using search queries.
    .DESCRIPTION
		Function to copy the Github release files into Powershell tempdir object, find code syntax relevant to construct queries.	
    .PARAMETER Tags
		Tags allows which Github Release file of interest are we to extract and report upon.	
		Acceptable range of version numbers is supplied in the switch statement in code below.
    .EXAMPLE
		PS C:\> CodeAuditRD -Tags "1.4.1"
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
if ($Tags) {
	switch($Tags)
	{
	  "1.4.1" { return "Processing v1.4.1"; break}
	  "1.4.2" { return "Processing v1.4.2"; break}
	  "1.4.3" { return "Processing v1.4.3"; break}
	  "2.0a.pre" { return "Processing v2.0a.pre"; break}
	  "2.0.1a.pre" { return "Processing v2.0.1a.pre"; break}
	  "2.0b" { return "Processing v2.0b"; break}
	  "2.0.1b" { return "Processing v2.0.1b"; break}
	  "2.0.2b" { return "Processing v2.0.2b"; break}
	  "2.0.3b" { return "Processing v2.0.3b"; break}
	  "2.0.4-rc" { return "Processing v2.0.4-rc"; break}
	  "2.0.5-rc" { return "Processing v2.0.5-rc"; break}
	  "2.0.6-rc" { return "Processing v2.0.6-rc"; break}
	  "2.0.7-rc" { return "Processing v2.0.7-rc"; break}
	  "2.0.8-rc" { return "Processing v2.0.8-rc"; break}
	  "2.0.9RC" { return "Processing v2.0.9RC"; break}
	  "2.0.10" { return "Processing v2.0.10"; break}
	  "2.0.11" { return "Processing v2.0.11"; break}
	  "2.0.12" { return "Processing v2.0.12"; break}
	  "2.0.13" { return "Processing v2.0.13"; break}
	  default { return "No release version number supplied!";exit; break}
	 } # switch
} # if $Tags

$SourceLocation="https://github.com/rubberduck-vba/Rubberduck/archive/v$Tags.zip"
echo "uses $SourceLocation"
[string]$githubRepo = $SourceLocation
[string]$destDir = "C:\Extract\"
$githubUriRegex="(?<Scheme>https://)(?<Host>github.com)/(?<User>\w*)/(?<Repo>\w*)(/archive/(?<Branch>master).zip)?"
echo "uses $githubRepo"
$githubMatch = [regex]::Match($githubRepo,$githubUriRegex)
Write-Host "uses $githubMatch"
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
} # function CodeAuditRD 
