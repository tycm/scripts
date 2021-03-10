$output = @()
$ErrorOut = @()
$searchbase = "OU=FileShares,OU=Groups,OU=DOMAIN,DC=DOMAIN,DC=COM"
$count = 1
$groups = get-adgroup -SearchBase $searchbase -Filter "*" | Where-Object {$_.GroupScope -notmatch "Global"}

foreach($group in $groups){
    Write-host "Getting $count out of 1290"
    $perccom = ($count / 1290) * 100
    Write-Progress -Activity "Reporting on Users" -Status "$perccom% Complete" -PercentComplete $perccom;
    $count++
    try{
        if(((Get-ADGroupMember $group | select-object | Where-Object {$_.distinguishedName -notmatch "OU=DOMAIN,DC=DOMAIN,DC=COM"}).count) -lt 1){
            continue
        }else{
            $output += $group.name
        }
    }catch{
        $ErrorOut += $group.Name
        Write-Host "NumErrors: $($ErrorOut.Count)" -ForegroundColor Red
    }
    
}
$output | Out-File H:\temp\Fileshares\TrustedGroupsNew.txt
$ErrorOut  | Out-File H:\temp\Fileshares\ErrorGroupsNew.txt
