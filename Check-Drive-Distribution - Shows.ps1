#####   Variables
$Shows1 = "\\file-srv-03\Shows\"
$Shows2 = "\\file-srv-03\Shows2\Shows\"
$Shows3 = "\\file-srv-03\Shows3\Shows\"

# Get Folder paths for folders at -Depth 0
$TopFolders = ("$Shows1","$Shows2","$Shows3")

# Get drive sizes
$DriveSizes = $TopFolders | ForEach-Object {
	((Get-ChildItem -Path $_ -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB )
}

$Shows1Size = [math]::Round($DriveSizes[0]) 
$Shows2Size = [math]::Round($DriveSizes[1])
$Shows3Size = [math]::Round($DriveSizes[2])

$TotalUsage = $Shows1Size + $Shows2Size + $Shows3Size

$OptimalUsage = [Math]::Round($TotalUsage /3)


if ($Shows1Size -lt $Shows2Size) {
	if ($Shows1Size -lt $Shows3Size) {
		$OptimalUsageOffBy = ($Shows1Size - $OptimalUsage) * -1

		$OptimalUsageOffByShows2 = if ($OptimalUsage -lt $Shows2Size) {
			$Shows2Size - $OptimalUsage
		}
		else {
			$OptimalUsageOffByShows2 = "0"
		}

		$OptimalUsageOffByShows3 = if ($OptimalUsage -lt $Shows3Size) {
			$Shows3Size - $OptimalUsage
		}
		else {
			$OptimalUsageOffByShows3 = "0"
		}

		Write-Host "Shows 1 is missing $OptimalUsageOffBy GB."
		Write-Host "Please move $OptimalUsageOffByShows2 GB from Shows 2, $OptimalUsageOffByShows3 GB from Shows 3, to Shows 1."
	}
}
if ($Shows2Size -lt $Shows1Size) {
	if ($Shows2Size -lt $Shows3Size) {
		$OptimalUsageOffBy = ($Shows2Size - $OptimalUsage) * -1

		$OptimalUsageOffByShows1 = if ($OptimalUsage -lt $Shows1Size) {
			$Shows1Size - $OptimalUsage
		}
		else {
			$OptimalUsageOffByShows1 = "0"
		}

		$OptimalUsageOffByShows3 = if ($OptimalUsage -lt $Shows3Size) {
			$Shows3Size - $OptimalUsage
		}
		else {
			$OptimalUsageOffByShows3 =  "0"
		}

		Write-Host "Shows 2 is missing $OptimalUsageOffBy GB."
		Write-Host "Please move $OptimalUsageOffByShows1 GB from Shows 1, $OptimalUsageOffByShows3 GB from Shows 3, to Shows 2."
	}
}

if ($Shows3Size -lt $Shows1Size) {
	if ($Shows3Size -lt $Shows2Size) {
		$OptimalUsageOffBy = ($Shows3Size - $OptimalUsage) * -1 

		$OptimalUsageOffByShows1 = if ($OptimalUsage -lt $Shows1Size) {
			$Shows1Size - $OptimalUsage	
		}
		else {
			$OptimalUsageOffByShows1 = "0"
		}

		$OptimalUsageOffByShows2 = if ($OptimalUsage -lt $Shows2Size) {
			$Shows2Size - $OptimalUsage
		}
		else {
			$OptimalUsageOffByShows2 = "0"
		}


		Write-Host "Shows 3 is missing $OptimalUsageOffby GB."
		Write-Host "Please move $OptimalUsageOffByShows1 GB from Shows 1, $OptimalUsageOffByShows2 GB from Shows 2, to Shows 3."
	}
}

Pause