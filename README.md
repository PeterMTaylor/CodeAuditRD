# CodeAudit

[![Build status](https://ci.appveyor.com/api/projects/status/p0i9fefb7u4jix9a/branch/master?svg=true)](https://ci.appveyor.com/project/PeterMTaylor/codeaudit/branch/master)

CodeAudit is a Powershell script to support developers in validating their GitHub codebase (C# at the moment) against CodeProject domains using browser search queries triggered by Powershell https requests.

## ToDO:
 Folder/File selection - Collect from github location release file. one firstly then a set.
 Files selection - Defaults to csharp at the moment.
Syntax selection - read each line and put results into four buckets for analysis.
Query construction - construct api like queries for execution using some syntax discovered.
Query execution - execute the query to return results for further analysis and reporting
Query results - process the output from query execution
Reporting audit outcomes

See our Licensing file for which software in this repro is currently licensed.

See our Contributing file to find the steps needed to contribute to this project.

# Attributions

The following list attributes the developers for their time I found in making CodeAudit.

Javy de Koning. Not licensed. Allow Powershell modules with AppVeyor https://github.com/javydekoning/AppVeyorDemo
Iain Brighton. MiT License. PScribo documentation framework for Powershell https://github.com/iainbrighton/PScribo

