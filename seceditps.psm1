$functions = Get-ChildItem -Path $PSScriptRoot\functions\*.ps1
foreach ($function in $functions.PSPath){
    . $function
}

$exportModuleMemberParams = @{
    Function = @(
        'Get-SecEditExport',
        'Get-SecEditProperty',
        'Import-SecEditConfiguration',
        'Set-SecEditProperty'
    )
}
       
Export-ModuleMember @exportModuleMemberParams
