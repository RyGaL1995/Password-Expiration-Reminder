# Password-Expiration-Reminder
Powershell Script to Prompt user to change Password when it expires in less than 5 days if there is no poup in a terminal/citrix server enviroment.


Installation Instructions

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
