#
# Powershell script for adding/removing/showing entries to the hosts file.
#

$file = join-path -path $env:SystemRoot -childpath "System32\drivers\etc\hosts"
$hostNote = "Added by startup script ManageHostsFile.ps1"

function add-host([string]$filename, [string]$ip, [string]$hostname) {
    Write-Host $hostname
	remove-host $filename $hostname
	$ip + "`t`t" + $hostname + "`t`t # " + $hostNote | Out-File -encoding ASCII -append $filename
}

function remove-host([string]$filename, [string]$hostname) {
	$c = Get-Content $filename
	$newLines = @()
	
	foreach ($line in $c) {
        # Skip line if it starts with an # (comment)
        if ($line -match "^#.*$") {
            $newLines += $line
            continue
        }

        # Strip off any comment behind entry
		$tempLine = [regex]::Split($line, "#")[0]
        $tempLine = $tempLine.Trim()
        
        # Split IP and hostname
		$bits = [regex]::Split($tempLine, "\t+")

		if ($bits.count -eq 2) {
            # Check hostname
			if ($bits[1] -ne $hostname) {
				$newLines += $line
			}
		} else {
			$newLines += $line
		}
	}
	
	# Write file
	Clear-Content $filename
	foreach ($line in $newLines) {
		$line | Out-File -encoding ASCII -append $filename
	}
}

function print-hosts([string]$filename) {
	$c = Get-Content $filename
	
	foreach ($line in $c) {
        # Skip line if it starts with an # (comment)
        if ($line -match "^#.*$") {
            $newLines += $line
            continue
        }
        
		$bits = [regex]::Split($line, "\t+")
		if ($bits.count -eq 2) {
			Write-Host $bits[0] `t`t $bits[1]
		}
	}
}