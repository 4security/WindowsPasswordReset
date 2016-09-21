#
# Script: ADResetPwd.ps1
# Description: Reset the password for bulk number of users, and 
# set the property to change passwrod required at next logon
#
# Written by: Anand Venkatachalapathy
#

Import-Module ActiveDirectory

# Set the default password
$password = ConvertTo-SecureString -AsPlainText “AwesomeP@ssw0rd” -Force 
 
# Get the list of accounts from the file on file
# List the user names one per line
$users = Get-Content -Path c:\MyScripts\UserList.txt
 
ForEach ($user in $users) 
{
    # Set the default password for the current account
    Get-ADUser $user | Set-ADAccountPassword -NewPassword $password -Reset
    
    #If you need to set the property “Change password at next logon”, 
    #leave the next alone. If not, comment the next line
    Get-ADUser $user | Set-AdUser -ChangePasswordAtLogon $true
    
    Write-Host “Password has been reset for the user: $user”
}

# ————- End ———–
