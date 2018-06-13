$importfile = "$PSScriptRoot\ad-user-import.csv"
$csv = Import-Csv $importfile 
Import-Module ActiveDirectory

Write-Host "Importing AD User NEW Telephone Numbers from:
$importfile" -ForegroundColor Cyan

foreach($line in $csv)
{
    $User = Get-ADUser -LDAPFilter "(&(objectclass=user)(mail=$($line.mail)))" -Properties *  
        Write-Host ------------------------------------------------------------------
        Write-Host user:  $line.samAccountName - $line.givenName $line.sn
        Write-Host old TN: $User.telephoneNumber -- new TN: $line.telephoneNumber
    Set-ADUser -Identity $line.samAccountName -Replace @{telephoneNumber=$line.telephoneNumber}       
}