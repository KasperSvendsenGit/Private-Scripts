#####   Variables
$Movies1 = "\\file-srv-03\Movies\Movies\"
$Movies2 = "\\file-srv-03\Movies2\Movies\"

# Get Folder paths for folders at -Depth 0
$TopFolders = ("$Movies1","$Movies2")

# Get drive sizes
$DriveSizes = $TopFolders | ForEach-Object {
	((Get-ChildItem -Path $_ -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB )
}

$Movies1Size = [math]::Round($DriveSizes[0]) 
$Movies2Size = [math]::Round($DriveSizes[1])

$TotalUsage = $Movies1Size + $Movies2Size

$OptimalUsage = [Math]::Round($TotalUsage /2)


if ($Movies1Size -lt $Movies2Size) {
    $OptimalUsageOffBy = ($Movies1Size - $OptimalUsage) * -1

    $OptimalUsageOffByMovies2 = if ($OptimalUsage -lt $Movies2Size) {
        $Movies2Size - $OptimalUsage
    }
    else {
        $OptimalUsageOffByMovies2 = "0"
    }

    Write-Host "Movies 1 is missing $OptimalUsageOffBy GB."
    Write-Host "Please move $OptimalUsageOffByMovies2 GB from Movies 2, to Movies 1."
	
}
if ($Movies2Size -lt $Movies1Size) {
    $OptimalUsageOffBy = ($Movies2Size - $OptimalUsage) * -1

    $OptimalUsageOffByMovies1 = if ($OptimalUsage -lt $Movies1Size) {
        $Movies1Size - $OptimalUsage
    }
    else {
        $OptimalUsageOffByMovies1 = "0"
    }

    Write-Host "Movie 2 is missing $OptimalUsageOffBy GB."
    Write-Host "Please move $OptimalUsageOffByMovies1 GB from Movies 1, to Movies 2."
	
}


Pause