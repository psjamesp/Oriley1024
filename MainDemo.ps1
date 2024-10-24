https://github.com/powershell/powershell


verb-noun

Get-Verb

Get-ChildItem
# These are the same thing
dir 
ls


Get-Alias


$PSVersionTable


Get-Verb | Sort-Object Verb
(get-command).count

Update-Help

get-help -Name Get-Command


get-command *service*

get-help -name *service*

show-command Restart-Service

Get-Command *service*


Get-Service -name Spooler
get-service -name spooler | Select-Object *
get-service -name spooler | Select-Object Name, StartType, Status | out-file .\servics.txt

get-service -name spooler | Get-Member

Get-Member 

get-service -name spooler

restart-service -name Spooler
(get-serivce -name spooler).restart() #Yes this work, but don't do it. do it via powershell


get-service -Name spooler | Stop-Service 
get-service -name spooler | Start-Service
get-service -name spooler | Restart-Service

stop-service -Name Spooler #Exact same thing at line 51
start-service -name spooler 
restart-service -name Spooler

$service = get-service -name Spooler

$dime = 10
$dime = "ten"
$dime = "10"

# Int + Int
5 + 5
# Int + String will not work
5 + "five" 
# Sting + String
"five" + 5
# String + Sting
"5" + 5 

Get-ChildItem | Sort-Object -Property name | Format-Table


write-host "$dime is 10" 
write-host '$dime is 10'

New-Item -Path "C:\scripts\Oriley_1024\Oriley1024" -name files1 -ItemType Directory

1..10 | ForEach-Object (new-item -name $_.md -ItemType File)

new-item -name test1.md -ItemType File

"dog"

"dog" | Out-Default


Write-Host "hi" -ForegroundColor green
Write-Output -

1..10 | Write-Output
1..10 | % { write-output $_ }
1..10 | % { write-output $_ ; start-sleep -Seconds 2 }
1..10 | ForEach-Object { write-output $_ }

Get-ChildItem -Path c:\scripts\Oriley_1024\Oriley1024 | Select-Object name | ForEach-Object { write-output $_ }


$files = Get-ChildItem -path c:\scripts\Oriley_1024\Oriley1024 | Select-Object Name

ForEach ($f in $files)
{ write-output $f }

$service = get-service spooler, BITS
foreach ($s in $service) {
    stop-service -name $s.Name
}

$service = get-service spooler, BITS
foreach ($s in $service) {
    if ($s.status -eq "stopped") {
        Start-Service $s.name
    }
}

$service = get-service (get-content .\services.txt)
foreach ($s in $service) {
    if ($s.status -eq "stopped") {
        Start-Service $s.name
    }
}
 -eq # Equal
 -NE # Not Equal
 -gt # Greater Than
 -ge # Greater than equal to
 -lt # Less than
 -le # Less than equal to

10 -gt 11

11 -gt 10

"cat" -eq "dog"

"cat" -eq "CAT"

"cat" -lt "dog"




Get-Date 

get-date | Get-Member

get-date | Select-Object hour

get-date -Format mm-dd-yyyy

get-date -Format "MM-dd-yyyy hh:mm"

get-date -Format MMddyyyyhhmm
(get-date).AddDays(-4)

$dog = "Daisy"
"My dogs name is $dog"
'My dogs name is $dog'

$files = 20..100
foreach ($f in $files) { new-item -path .\files\$f.md }

$folder = 'c:\scripts\Oriley_1024\Oriley1024\files'


Get-ChildItem -Path $folder -Recurse | Where-Object Name -NE "_readmefirst.txt" | Remove-Item
Get-ChildItem -Path $folder -Recurse | Where-Object { $_.Name -eq "_readmefirst.txt" `
        -and $_.lastwritetime -gt "5/5/2024" } | Remove-Item

-eq Equal
-NE Not Equal
-gt Great Than
-lt Less Than
-le Less than or Equal to
-ge greater than or equal to
-and 
-like
-notlike
-match




Remove-Item

# Remoting
$cred = Get-Credential
Enter-PSSession -ComputerName srv01 -Credential $cred

invoke-command -ComputerName srv01, srv02 -ScriptBlock { $env:COMPUTERNAME } -Credential 714tech\bob

invoke-command -ComputerName (get-content c:\scripts\computers.txt) -ScriptBlock { $env:COMPUTERNAME }
invoke-command -ComputerName (Import-Csv c:\scripts\computers.Import-Csv) -ScriptBlock { $env:COMPUTERNAME }
invoke-command -ComputerName (get-adcomputer -filter "OU=printers,dc=test,dc=lab") -ScriptBlock { $env:COMPUTERNAME }

invoke-command -ComputerName srv01, srv02 -FilePath c:\scripts\myfile.ps1 -Credential 714tech\bob

# File system
Get-ChildItem
Set-LocalGroup
New-Item

Get-PSDrive

$env:computername

If ($IsMacOS -eq $true) {}
elseif ($IsLinux -eq $true) {}
else {}

switch ($OS) {
    $IsMacOS {}
    $IsLinux {}
    $IsWindows {}
    Default {}
}

get-item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -value "3399"

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface" -value "yes"

Remove-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface"

ForEach-Object ($s in $servers)
copy-item -Path \\myshare.test.lab\sql2024update.msu -Destination \\$s\d:\temp
} -parallel


$session = New-PSSession -ComputerName srv01, srv02, dc01 -Credential 714tech\bob

Enter-PSSession -Session $session

copy-item -fromsession $session -path c:\sql.msu -Destination d:\temp

invoke-command srv01, srv02 -ScriptBlock { copy-item -path \\myserverpath\sqlupdate.msu -Destination d:\temp }