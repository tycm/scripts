$videos = Get-Content "C:\Users\tycm\Desktop\test.xml"

for ($i = 1; $i -lt $videos.Count; $i++)
{ 
    if($videos[$i].contains("guid")){
        $url = $videos[$i].substring(12,$videos[$i].length-12-7)
        $outfileName = $videos[$i - 2].Substring(22, $videos[$i -2].Length-22-17)
        $outFilePath = "C:\Users\tycm\Documents\School\Math 2164\pVideos\$($outfileName).mp4"
        write-host "Downloading file to $($outFilePath)" -ForegroundColor Green
        $webclient = New-Object System.Net.WebClient
        $webclient.DownloadFile($url, $outFilePath)
    }
}
