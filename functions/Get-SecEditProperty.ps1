function Get-SecEditProperty {

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$false)]
        [string] $Property
    )

    $output = Get-SecEditExport
    $hashtable = New-Object -TypeName hashtable

    foreach ($line in $output) {
        if ($line[0] -ne '[') {
            $splitLine = $line.split('=').trim()
            $hashtable.Add($splitLine[0],$splitLine[1])
        } 
    }

    if ($Property -ne '') {
        Write-Output $hashtable.$Property
    } else {
        Write-Output $hashtable
    }
}
