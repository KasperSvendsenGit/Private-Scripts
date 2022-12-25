# Get All text files and combine to fewer files
$lists = Get-ChildItem -Recurse -Path "F:\_wl\text_files\" -Include "*.txt" 

$counterX = [int]0
$counterY = [int]999
$i = [math]::Round($lists.Count / 1000)
$i = [int32]$i
$o = [int32]1

do {
	$currentlist = $lists[$counterX..$counterY]
	foreach ($l in $currentlist) {
		$l | Get-Content | Add-Content "F:\_wl\combined\combined_list_$counterX-$counterY.txt"
	}

	$counterX = $counterX + 1000
	$counterY = $counterY + 1000
	$o + 1
} while (
	$o -le $i
)


# Get fewer files and combine to one
$lists = Get-ChildItem -Recurse -Path "F:\_wl\combined\" -Include "*.txt"

foreach ($l in $lists) {
	$l | Get-Content | Add-Content "F:\_wl\combined_list_0-48999.txt"
}


# Get content of files, save to single file
$Infile = "F:\_wl\combined_list_0-48999.txt"
$OutfileEmail = "F:\_wl\Emails.txt"
$OutfilePW = "F:\_wl\passwordlist.txt"

$StreamReader = [System.IO.StreamReader]::new($Infile)
$StreamWriterEmail =  [System.IO.StreamWriter]::new($OutfileEmail)
$StreamWriterPW =  [System.IO.StreamWriter]::new($OutfilePW)

while (-not $StreamReader.EndOfStream) {
	foreach ($line in $StreamReader.Readline()) {
		$splitline = $line.Split(":")
		$splitline | ForEach-Object {
			if ($_.Contains("@") -and $_.Length -gt 2) {
				$StreamWriterEmail.WriteLine([system.string]$_)
			}
			else {
			$StreamWriterPW.WriteLine([system.string]$_)
			}
		}
	}
}

$StreamReader.Close()
$StreamWriterEmail.Close()
$StreamWriterPW.Close()


# Remove hashed files from password list
$Infile = "F:\_wl\passwordlist.txt"
$Outfilehashes = "F:\_wl\hashes.txt"
$OutfilePW = "F:\_wl\passwordlist_unhashed.txt"

$StreamReader = [System.IO.StreamReader]::new($Infile)
$StreamWriterhashes =  [System.IO.StreamWriter]::new($Outfilehashes)
$StreamWriterPW =  [System.IO.StreamWriter]::new($OutfilePW)

while (-not $StreamReader.EndOfStream) {
	foreach ($line in $StreamReader.Readline()) {

		if (($line.Length -eq 49) -or ($line.Length -eq 128) -or ($line.Length -eq 0) -or ($line.Length -eq 34)) {
			$StreamWriterhashes.WriteLine([system.string]$line)
		}
		else {
		$StreamWriterPW.WriteLine([system.string]$line)

		}
	}
}

$StreamReader.Close()
$StreamWriterhashes.Close()
$StreamWriterPW.Close()




