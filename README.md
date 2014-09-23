# Manage Windows hosts file from startup script #

Adds or removes entries from Windows hosts file. For use as startup script for example.


## Installation: ##

In your Group Policy:  
- Go to: Computer Configurations >> Policies >> Windows Settings >> Scripts (Startup/Shutdown)  
- Open "Startup"  
- Select "PowerShell Scripts" tab  
- Click "Show Files..."  
- Copy the two ps1 files to this directory  
- Back in "Startup Properties", click "Add.." and select "ManageHostsFile.ps1"  
- Done.

Note:  
It may not work if you execute it from cmd because of the PowerShell restrictions. For testing on command line you can execute "set-ExecutionPolicy RemoteSigned" from an elevated cmd (Don't forget to set it back to "Restricted" after testing). On startup the script is executed as system user which bypasses the execution policy.

## Usage: ##

In the file "ManageHostsFile.ps1" you can add host to be added or removed:
add-host -filename $file -ip "10.10.11.12" -host "foobar"
remove-host -filename $file -host "foobar"

## Credits: ##
It's basen on the script of Mark Embling:  
https://gist.github.com/markembling/173887

## License ##
GPLv3, see LICENCE file.