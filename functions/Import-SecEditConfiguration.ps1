function Import-SecEditConfiguration {
   
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $DatabasePath,
        [Parameter(Mandatory=$true)]
        [string] $ConfigPath,
        [Parameter(Mandatory=$false)]
        [string[]] $Areas,
        [Parameter(Mandatory=$false)]
        [string] $LogPath,
        [Parameter(Mandatory=$false)]
        [switch] $Quiet
    )

    if (!(Test-Path -Path $DatabasePath)) {
        #throw "$DatabasePath does not exist."
    }
    if (!(Test-Path -Path $ConfigPath)) {
        #throw "$ConfigPath does not exist."
    }
    if ($LogPath) {
        $logString = "/log $LogPath"
    }

    if ($Areas) {
        $areaString = "/areas $($Areas.join(','))"
    }    
    if ($Quiet) {
        $quietString = "/quiet"
    }

    $validationOutput = secedit /validate $ConfigPath | Out-Null
    $configureOutput = secedit /configure /db $DatabasePath /cfg $ConfigPath $areaString $logString $quietString

}