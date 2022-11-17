########################################
#####    Media Management Script   #####
#####------------------------------#####
#####             Shows            #####
########################################

########################################
#####        Requried tools        #####
#####------------------------------#####
##### ffmpeg.exe                   #####
########################################

########################################
#####  Requried Powershell Modules #####
#####------------------------------#####
########################################

########################################
#####      Other Dependencies      #####
#####------------------------------#####
########################################

########################################
#####       Global variables       #####
########################################
$SourceFolder = "D:\_\_Rendering\_Rendered\_Shows ready to move\"


Set-Location -Path $SourceFolder

##### Set $Title and clear $Description #####
Get-ChildItem -Path $SourceFolder -Filter *.mp4 |
    ForEach-Object {
        $ChildPath = Join-Path -Path $_.Name.Replace('.mp4','') -ChildPath $_.Name

        [System.IO.FileInfo]$Destination = Join-Path -Path $SourceFolder -ChildPath $ChildPath

        $tempName = $_.BaseName + "temp.mp4" 
        $tempNamePath = $SourceFolder + $tempName
        $Title = $_.BaseName
        Rename-Item -Path $_.FullName -NewName $tempName

        ffmpeg.exe -i $tempName -metadata title=$Title -metadata comment='' -codec copy -stats $_.FullName

        
        Remove-Item -Path $tempNamePath
    }



##### Create folders from file name and move files #####
# Show folders
Get-ChildItem -Path $SourceFolder -Filter *.mp4 |
    ForEach-Object {
        $ShowBaseName = [System.String]::Join("", $_.BaseName).TrimEnd(0)
        $ShowName = $ShowBaseName -replace ".{7}$"
        $ShowNameFullName = $SourceFolder + $ShowName

        $SeasonEpisode = $ShowBaseName.TrimStart($ShowName)
        $SeasonEpisode = $SeasonEpisode.Trim()

        # Test if show folder already exists
        if( -not ( Test-Path -Path $SourceFolder\$ShowName -PathType Container ) ){
            New-Item -ItemType Directory -Path $SourceFolder\$ShowName
        }
        Move-Item -Path $_.FullName -Destination $ShowNameFullName
    }


# Season folders
Get-ChildItem -Path $SourceFolder -Filter *.mp4 -Recurse |
    ForEach-Object {
        $ShowBaseName = [System.String]::Join("", $_.BaseName).TrimEnd(0)
        $ShowName = $ShowBaseName -replace ".{7}$"
        $ShowNameFullName = $SourceFolder + $ShowName

        $SeasonEpisode = $ShowBaseName.TrimStart($ShowName)
        $SeasonEpisode = $SeasonEpisode.Trim()

    # Test if Season 1 exists        
    if ($SeasonEpisode -like "S01*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 1" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 1"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 1"
    }

        # Test if Season 2 exists        
    if ($SeasonEpisode -like "S02*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 2" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 2"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 2"
    }
        # Test if Season 3 exists        
    if ($SeasonEpisode -like "S03*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 3" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 3"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 3"
    }

        # Test if Season 4 exists        
    if ($SeasonEpisode -like "S04*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 4" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 4"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 4"
    }

        # Test if Season 5 exists        
    if ($SeasonEpisode -like "S05*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 5" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 5"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 5"
    }

        # Test if Season 6 exists        
    if ($SeasonEpisode -like "S06*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 6" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 6"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 6"
    }

        # Test if Season 7 exists        
    if ($SeasonEpisode -like "S07*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 7" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 7"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 7"
    }

        # Test if Season 8 exists        
    if ($SeasonEpisode -like "S08*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 8" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 8"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 8"
    }

        # Test if Season 9 exists        
    if ($SeasonEpisode -like "S09*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 9" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 9"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 9"
    }

        # Test if Season 10 exists        
    if ($SeasonEpisode -like "S10*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 10" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 10"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 10"
    }

        # Test if Season 11 exists        
    if ($SeasonEpisode -like "S11*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 11" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 11"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 11"
    }

        # Test if Season 12 exists        
    if ($SeasonEpisode -like "S12*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 12" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 12"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 12"
    }

        # Test if Season 13 exists        
    if ($SeasonEpisode -like "S13*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 13" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 13"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 13"
    }

        # Test if Season 14 exists        
    if ($SeasonEpisode -like "S14*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 14" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 14"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 14"
    }

        # Test if Season 15 exists        
    if ($SeasonEpisode -like "S15*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 15" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 15"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 15"
    }

        # Test if Season 16 exists        
    if ($SeasonEpisode -like "S16*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 16" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 16"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 16"
    }

        # Test if Season 17 exists        
    if ($SeasonEpisode -like "S17*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 17" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 17"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 17"
    }

        # Test if Season 18 exists        
    if ($SeasonEpisode -like "S18*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 18" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 18"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 18"
    }

        # Test if Season 19 exists        
    if ($SeasonEpisode -like "S19*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 19" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 19"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 19"
    }

        # Test if Season 20 exists        
    if ($SeasonEpisode -like "S20*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 20" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 20"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 20"
    }

        # Test if Season 21 exists        
    if ($SeasonEpisode -like "S21*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 21" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 21"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 21"
    }

        # Test if Season 22 exists        
    if ($SeasonEpisode -like "S22*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 22" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 22"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 22"
    }

        # Test if Season 23 exists        
    if ($SeasonEpisode -like "S23*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 23" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 23"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 23"
    }

        # Test if Season 24 exists        
    if ($SeasonEpisode -like "S24*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 24" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 24"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 24"
    }

        # Test if Season 25 exists        
    if ($SeasonEpisode -like "S25*") {
        if ( -not ( Test-Path -Path "$ShowNameFullName\Season 25" -PathType Container ) ) {
            New-Item -ItemType Directory -Path "$ShowNameFullName\Season 25"
        }
         Move-Item -Path $_.FullName -Destination "$ShowNameFullName\Season 25"
    }
}

