$ListOfUsers = "user01", "user02"
foreach ($user in $ListOfUsers) {
    #Generate a 15-character random password.
    $Password = -join ((33..126) | Get-Random -Count 15 | ForEach-Object { [char]$_ })
    #Export userid and new password to csv file.
    $ExportData = [pscustomobject]@{
        "user"     = $user
        "Password" = $Password
    }
    $ExportData | Export-Csv C:\temp\userinfo.csv -Append -NoTypeInformation
}
