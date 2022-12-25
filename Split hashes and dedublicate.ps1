
# Split hashes and passwords into seperate files

$Infile = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-raw-output1.txt"
$Outfilehashes = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-hashes-output1.txt"
$OutfilePW = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-passwords-output1.txt"

$StreamReader = [System.IO.StreamReader]::new($Infile)
$StreamWriterhashes =  [System.IO.StreamWriter]::new($Outfilehashes)
$StreamWriterPW =  [System.IO.StreamWriter]::new($OutfilePW)

while (-not $StreamReader.EndOfStream) {
	foreach ($line in $StreamReader.Readline()) {
        
        $splitline = $line.Split(":")
        $splitline | ForEach-Object {
		    if ($_.Length -eq 40) {
			    $StreamWriterhashes.WriteLine([system.string]$_)
		    }
		    else {
		    $StreamWriterPW.WriteLine([system.string]$_)
            }
		}
	}
}

$StreamReader.Close()
$StreamWriterhashes.Close()
$StreamWriterPW.Close()











