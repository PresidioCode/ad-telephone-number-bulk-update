Import-Module ActiveDirectory
$exportfile = "$PSScriptRoot\ad-user-export.csv"

Write-Host "Exporting AD Users and Telephone Numbers to:
$exportfile" -ForegroundColor Cyan

# output AD users and phone to CSV file            
Get-ADUser -LDAPFilter “(mail=*)” -SearchBase "DC=PRESIDIO-DEMO,DC=COM" -Properties samAccountName, mail, givenName, sn, telephoneNumber |            
  Select samAccountName, mail, givenName, sn, telephoneNumber |            
  Export-CSV -Path $exportfile -NoTypeInformation
