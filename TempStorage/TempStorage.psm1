function Remove-TempFiles {
    param (
        OptionalParameters
    )
    $numfiles = (Get-ChildItem | Where-Object Name -NE "_readmefirst.txt").count 
    $date = get-date -format MMddyyyyhhmm

    If ($numfiles -gt 0) {
        Get-ChildItem | Where-Object Name -NE "_readmefirst.txt" | Remove-Item 
        Add-Content -Path C:\scripts\Oriley_1024\Oriley1024\logs\logs.log -Value "$date - Deleted $numFiles Items"
    }
    else {Add-Content -Path C:\scripts\Oriley_1024\Oriley1024\logs\logs.log -Value "$date - Nothing to Delete "}   

}

function New-TempFiles {
    $files = 20..100
    foreach ($f in $files) { new-item -path .\ -name "$f.md" }
}
