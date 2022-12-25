
# Split hashes and passwords into seperate files

$Infile = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-raw-output4.txt"
$fullhashlist = "D:\_\_Rendering\OneDrive_1_12-25-2022\pwned-passwords-sha1-trimmed_01.txt"

$Outfilehashesfound = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-hashes-output4.txt"
$Outfilehashesnotfound = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-hashes-output4.txt"
$OutfilePW = "D:\_\_Rendering\OneDrive_1_12-25-2022\haveibeenpwned-passwords-output4.txt"




$StreamReader = [System.IO.StreamReader]::new($Infile)
$fullhashlistStreamReader = [System.IO.StreamReader]::new($fullhashlist)
$StreamWriterhashesfound =  [System.IO.StreamWriter]::new($Outfilehashesfound)
$StreamWriterhashesnotfound =  [System.IO.StreamWriter]::new($Outfilehashesnotfound)
$StreamWriterPW =  [System.IO.StreamWriter]::new($OutfilePW)

while (-not $StreamReader.EndOfStream) {
	foreach ($line in $StreamReader.Readline()) {
        
        $splitline = $line.Split(":")
        $splitline | ForEach-Object {
		    if ($_.Length -eq 40) {
                foreach ($fullline in $fullhashlistStreamReader.ReadLine()) {
                    if ($fullline -eq $_) {
                        # if the current string is found in both files, write to found
                        $StreamWriterhashesfound.WriteLine([System.String]$_)
                    }
                    elseif ($fullline -ne $_) {
                        # uf the current string is NOT found in both files, write to not found
                        $StreamWriterhashesnotfound.WriteLine([system.string]$_)
                    }
                }    
            }
	    }
	    else {
	        $StreamWriterPW.WriteLine([system.string]$_)
        }
	}
}




$StreamReader.Close()
$StreamWriterhashesfound.Close()
$StreamWriterPW.Close()
$fullhashlistStreamReader.Close()
$StreamWriterhashesnotfound.Close()

