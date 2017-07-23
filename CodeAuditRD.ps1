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
		PS C:\> CodeAuditRD -Tags "1.4.1" -verbose
    .NOTES
		Written by Peter M Taylor for Rubberduck VBA Project
		Rubberduck VBA Project https://github.com/rubberduck-vba/Rubberduck
    		Script adapted from https://github.com/stadub/PowershellScripts/DownloadGithub.ps1
		Author Webpage https://petermtaylor.github.io/
		Author Twitter @peterlearning24
		Author Github https://github.com/PeterMTaylor
<<<<<<< HEAD
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
Write-Verbose -Message "Starting..."
$SourceLocation="https://github.com/rubberduck-vba/Rubberduck/archive/v$Tags.zip"
Write-Verbose -Message "Received for SourceLocation $SourceLocation"
[string]$githubRepo = $SourceLocation
Write-Verbose -Message $githubRepo
[string]$destDir = "C:\Extract\"
Write-Verbose -Message $destDir
$githubUriRegex="(?<Scheme>https://)(?<Host>github.com)/(?<User>\w*)/(?<Repo>\w*)(/archive/(?<Branch>master).zip)?"
Write-Verbose $githubUriRegex
$githubMatch = [regex]::Match($githubRepo,$githubUriRegex)
Write-Verbose "uses $githubMatch"
Write-Verbose "Pending information is correct, then test again after successful fetch of zipped files, denies function use after fail fetch then switch off check return processing"
=======
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
>>>>>>> refs/remotes/origin/master
#function GetGroupValue($match, [string]$group, [string]$default=""){
#	$val=$match.Groups[$group].Value
#	Write-Debug $val
#	if($val){
#		return $val
#	}
#	return $default
#}
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
#if( ! $(GetGroupValue $githubMatch "Host") ){
#	throw [System.ArgumentException] "Incorrect 'Host' value. The 'github.com' domain expected"
#	#Write-Error -Message "Incorrect 'Host' value. The 'github.com' domain expected" -Category InvalidArgument
#}

#Because url can be in different formats 
#$githubUrl='https://github.com/{0}/{1}/archive/{2}.zip' -f 
#						$(GetGroupValue $githubMatch "User"),
#						$(GetGroupValue $githubMatch "Repo"), 
#						$(GetGroupValue $githubMatch "Branch" "master")

<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
return "done!"
} # function CodeAuditRD 
=======

#if( $installScrip ){
#	if ( Test-Path -path $destDir\$installScrip){
#		&  $destDir\$installScrip
#	}
#	else{
#		Write-Warning "Installer script is not found."
#	}
#}
>>>>>>> refs/remotes/origin/master
