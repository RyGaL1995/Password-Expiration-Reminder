import-module activedirectory
$CurrentUser = $env:username

$PassExpiry = (([datetime]::FromFileTime((Get-ADUser –Identity $CurrentUser -Properties "msDS-UserPasswordExpiryTimeComputed")."msDS-UserPasswordExpiryTimeComputed"))-(Get-Date)).Days

If ( $PassExpiry -lt 5 ){ 
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


$answer = [System.Windows.Forms.MessageBox]::Show("Your Password will expire in $PassExpiry days, Do you wan't to change it now?" , "Status" , 4)

if ($answer -eq "YES" ) {

(New-Object -COM Shell.Application).WindowsSecurity()

} 

}
else {
}

