Import-Module ActiveDirectory
$totalusers = 10
for ($i=0; $i -lt $totalusers; $i++) 
 { 
 $userID = "{0:00}" -f ($i + 1)
 $userName = "TestUser$userID"
 
 Write-Host "Creating AD user" ($i + 1) "of" $totalusers ":" $userName
 
New-ADUser `
 -Name $userName  `
 -Path  "CN=Users,DC=elegis,DC=be" `
 -SamAccountName $userName `
 -AccountPassword (ConvertTo-SecureString "Azerty+123" -AsPlainText -Force) `
 -Enabled $true
 Add-ADGroupMember "Horizon Test Users" $userName;
}
