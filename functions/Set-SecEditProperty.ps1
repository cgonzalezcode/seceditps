function Set-SecEditProperty {

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Property,
        [Parameter(Mandatory=$true)]
        [string] $Value,
        [Parameter(Mandatory=$false)]
        [switch] $Force
    )

    if (!(Get-SecEditProperty -Property $Property)) {
        if ($Force) {
            Write-Warning "Property $Property does not already exist. Adding new property."
        } else {
            Write-Error "Property $Property does not already exist. Use the -Force flag to add the property."
        }
    }

    $output = (Get-SecEditExport).Replace(" =","=")
    $line = $output -like "$Property=*"
    
    if ($line) {
        $splitLine = $line.split('=').trim()
        $newLine = $splitLine[0] + "=" + $Value
        $newPolicy = $output.Replace($line,$newLine)
    }  else {
        $newLine = $Property + "=" + $Value
        $newPolicy = $output + $newLine
    }

    $configFile = New-TemporaryFile 
    $newPolicy | Out-File -FilePath $configFile.FullName | Out-Null

    $guid = (New-Guid)
    $tempDB = '"C:\temp\'+$guid+'.sdb"'

    $params = @{
        DatabasePath = $tempDB
        ConfigPath = '"' + $configFile.FullName + '"'
    }

    Import-SecEditConfiguration @params -quiet

    #Remove-Item "C:\Windows\security\database\$guid.sdb" -Force
    #Remove-Item "C:\Windows\security\database\$guid.jfm" -Force
}
