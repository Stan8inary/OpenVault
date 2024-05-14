$csvFile = "C:\migration\listofonedrive.csv"
$table = Import-Csv $csvFile -Delimiter ","
$MyPassword = ConvertTo-SecureString 'My password' -AsPlainText -Force
$MyUsername = "My username"
Set-Variable dstSite, dstList
foreach ($row in $table) {
    Clear-Variable dstSite
    Clear-Variable dstList
    $dstSite = Connect-Site -Url $row.ONEDRIVEURL -UserName $MyUsername -Password $MyPassword
    $dstList = Get-List -Name Documents -Site $dstSite
    Import-Document -SourceFilePath "C:\H_Drive" -DestinationList $dstList
}
