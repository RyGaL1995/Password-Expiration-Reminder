# Password-Expiration-Reminder
Powershell Script to Prompt user to change Password when it expires in less than 5 days if there is no poup in a terminal/citrix server enviroment.

Created and tested in a Windows Server 2008 R2 DC and Citrix XA 6.5 Server
Tested and working on Windows Server 2012 R2 DC and Citrix XA 7.2 Server

Why?

In some terminal/citrix server enviroments where the user logs on via a thin client or a machine that is not on the domain then they will not get a mesage that their password will expire. Even though there are some standard GPO's to implement a notification I could not get them to work so wrote this script.

How it works:

The Script runs at the users login and if their password expires in less then 5 days it will prompt them to ask them to change their password. If they select yes then it will take them to the Windows Security Screen where they can change there password.

The Prompt is similar to the one from Windows XP but loads after the user is logged in.

Notes:

On Windows Server 2012 R2 there is a Startup delay for logon scripts of 5 minutes. You can change the delay between user logon and when scripts run with the policyby adding "Computer Configuration\Policies\Administrative Templates\System\Group Policy\Configure Logon Script Delay" enabling and specifying a time or disabling the Delay.

You can change the password expiry days for the user to be notified by changeing line 3 in the "Password-Expiration-Reminder.ps1" script. $WariningZone = 5 <-- Change this Number

Instructions:

1. On the terminal server Extract the files in the zip
2. Right Click on SAT-AD-PowerShell.ps1 and choose "Run with Powershell"
3. If you get no errors procede to step 4 - If you get the error "SAT-AD-PowerShell.ps1 cannot be loaded because the execution of scripts is disabled on this system." open "set-executionpolicy unrestricted.txt" and copy the contents into an powershell administrator window, then press enter. Then repeat step 2.
4. Create GPO to run the script at logon Create a new GPO and browse to, User Configuration>Policies>Windows Settings>Scripts>Logon
5. Go to the "PowerShell Scripts" tab and click add.
6. On Script Name click browse amd paste "Password-Expiration-Reminder.ps1" and open it.
7. Click Ok.
8. Under "For this GPO, Run Scripts in the following order" choose "Run Windows PowerShell scripts last" and click Ok.
9. Close the GPO editor and link the GPO to the Users or Servers OU that you want to be affected.
10. login and test
