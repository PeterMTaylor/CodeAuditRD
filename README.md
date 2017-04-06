# CodeAudit

[![Build status](https://ci.appveyor.com/api/projects/status/p0i9fefb7u4jix9a/branch/master?svg=true)](https://ci.appveyor.com/project/PeterMTaylor/codeaudit/branch/master)

CodeAudit is a Powershell script (under MiT license) to support developers in validating their Github codebase against CodeProject domains using browser search queries triggered by Powershell https requests.

# ToDO:
 
- [ ] Stage 1 Collect from github location release file 
- [ ] Stage 2 Files selection - Defaults to Csharp file format at the moment. 
- [ ] Stage 3 Syntax selection - read each line and put results into four buckets for analysis. 
- [ ] Stage 4 Query construction - construct api like queries for execution using some syntax discovered. 
- [ ] Stage 5 Query execution - execute the query to return results for further analysis and reporting 
- [ ] Stage 6 Query results - process the output from query execution. 
- [ ] Stage 7 Reporting audit outcomes. 

# Attributions

The following list attributes the developers for their time and their code in making CodeAudit to where we are at today. 
* Javy de Koning. Not licensed. Allow Powershell modules with AppVeyor. https://github.com/javydekoning/AppVeyorDemo
* Iain Brighton. MiT licensed. Powershell script to polish up documentation. https://github.com/iainbrighton/PScribo 
* Francois-Xavier Cat. MIT licensed. Powershell script ideas and tips. https://github.com/lazywinadmin
* Dima Stadub. Not licensed. Download Github release files using Powershell and unpack zip file. https://github.com/stadub/PowershellScripts
