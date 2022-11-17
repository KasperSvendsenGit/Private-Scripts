$Filepath = "D:\_\_Rendering\InProgress\__Renamed\Fully Downloaded"
$Files = Get-ChildItem -Path $Filepath -Depth 0 

Set-Location -Path $Filepath


$Files | ForEach-Object {
    $pixfmt = ffprobe -v error -hide_banner -of default=noprint_wrappers=0 -print_format flat -select_streams v:0 -show_entries stream=pix_fmt $_
    $_ | Add-Member -MemberType NoteProperty -Name pixelformat -Value $pixfmt.Split("=")[1]

    $encfmt = ffprobe -v error -select_streams v:0 -show_entries stream=codec_long_name -of default=noprint_wrappers=1:nokey=1 $_
    $_ | Add-Member -MemberType NoteProperty -Name encodingformat -Value $encfmt
}

$Files | Format-Table Name,encodingformat,pixelformat

pause
