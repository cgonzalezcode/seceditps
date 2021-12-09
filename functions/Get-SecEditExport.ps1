function Get-SecEditExport {

    $file = New-TemporaryFile
    secedit /export /cfg $file.FullName | Out-Null
    (Get-Content $file.FullName).Split([Environment]::NewLine)
    Remove-Item $file | Out-Null

}