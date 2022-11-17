########################################
#####    Media Management Script   #####
#####------------------------------#####
#####             Movies           #####
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
$SourceFolder = "D:\_\_Rendering\_Rendered\_Movies ready to move\"
########################################

Set-location -Path $SourceFolder

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
Get-ChildItem -Path $SourceFolder -Filter *.mp4 |
    ForEach-Object {
        $ChildPath = Join-Path -Path $_.Name.Replace('.mp4','') -ChildPath $_.Name

        [System.IO.FileInfo]$Destination = Join-Path -Path $SourceFolder -ChildPath $ChildPath

        if( -not ( Test-Path -Path $Destination.Directory.FullName ) ){
            New-Item -ItemType Directory -Path $Destination.Directory.FullName
            }

        Move-Item -Path $_.FullName -Destination $Destination.FullName

        $DestinationPath = Get-ChildItem -Path $SourceFolder -Filter $_.Name -Recurse
        New-Item -ItemType File -Name $_.Name.TrimEnd('.mp4') -Path $DestinationPath.DirectoryName
        }
