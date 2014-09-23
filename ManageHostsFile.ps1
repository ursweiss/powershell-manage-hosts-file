# Include the functions
$thisScriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ($thisScriptPath + '.\HandleHostsFileContent.ps1')


# Remove hosts
#remove-host -filename $file -host "foobar"

# Add hosts
#add-host -filename $file -ip "10.10.11.12" -host "foobar"