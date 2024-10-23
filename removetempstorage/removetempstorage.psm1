function remove-tempstoragefile {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$folder
    )
    try {
        $numfiles = (Get-ChildItem -Path $folder -ErrorAction Stop).count 
        If ($numfiles -gt 1) {
            Get-ChildItem -Path $folder -Recurse | Where-Object Name -NE "_readmefirst.txt" | Remove-Item
            $date = get-date -format MMddyyyyhhmm
            Add-Content -Path C:\scripts\Oriley_1024\Oriley1024\logs\logs.log -Value "$date - Deleted $numFiles Items"
        }
        else {
            Add-Content -Path C:\scripts\Oriley_1024\Oriley1024\logs\logs.log -Value "$date - Nothing to Delete "
        }
    }
    catch {
        Add-Content -Path C:\scripts\Oriley_1024\Oriley1024\logs\logs.log -Value "Oh NO Something Happened $Error"

    }
    finally{write-host "I'm finsihed"}
}

