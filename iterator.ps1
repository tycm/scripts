$Path = "C:\temp\package\messages"
$count = 0
Get-ChildItem -Path $Path | ForEach-Object {
    
    if($_.Extension -ne ""){

    }else{
        $hstring = $_.FullName + "\messages.csv"
        $dest = $_.FullName + "\$($count).csv"
        $cstring = Import-Csv $hstring
        if ($cstring.Count -gt 0) {
            $count = $count + 1
            Move-Item -Path $hstring -Destination $dest
            # Write-Host $count $hstring
            write-host $dest
        }
    }    
}
