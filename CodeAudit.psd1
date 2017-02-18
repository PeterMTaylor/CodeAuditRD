@{
   RootModule = 'CodeAudit.psm1';
   ModuleVersion = '1.0.0';
   GUID = 'a68b72b8-5322-47fe-b444-65c3e8042bdc';
   Author = 'Peter M TAYLOR';
   CompanyName =  'Peter M Taylor on Github';
   Copyright = '(c) 2017 Peter M Taylor. All rights reserved.';
   Description = 'Code Audit usng GitHub release file with source code to audit selected domains for license verification.';
   PowerShellVersion = '5.0';
   #FunctionsToExport = @('Install-CodeAudit');
   PrivateData = @{
        PSData = @{
            Tags = @('PowerShell','GitHub','Repository','Install','Development','Module')
            LicenseUri = 'https://raw.githubusercontent.com/PeterMTaylor/CodeAudit/master/LICENSE';
            ProjectUri = 'https://github.com/PeterMTaylor/CodeAudit';
            # IconUri = '';
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}
