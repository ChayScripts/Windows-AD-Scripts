# Import the Active Directory module
Import-Module ActiveDirectory
# Get all users with the same email address
$users = Get-ADUser -Filter * -Properties EmailAddress, Enabled, DisplayName | Group-Object -Property EmailAddress | Where-Object {$_.Count -gt 1}
 
$results = @()
# Loop through each group of users with the same email address
foreach ($group in $users) {
    # Loop through each user in the group
    foreach ($user in $group.Group) {
        # Create a custom object with the required properties
        $results += [PSCustomObject]@{
            GivenName = $user.GivenName
            Surname = $user.Surname
            DisplayName = $user.DisplayName
            EmailAddress = $user.EmailAddress
            Enabled = $user.Enabled
        }
    }
}
 
$results | Export-Csv C:\Temp\userslist.csv -NoTypeInformation
