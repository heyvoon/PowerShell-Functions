Function Connect-Msol {
    # Only Connect to MSOL Service if not already connected
    if(-not (Get-MsolDomain -ErrorAction SilentlyContinue))
        {
            $O365Cred = Get-Credential -Message "Please provide credentials for Microsoft Online"

            $O365Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $O365Cred -Authentication Basic -AllowRedirection -ErrorAction Stop
            Connect-MsolService –Credential $O365Cred

            Import-PSSession $O365Session | Out-Null
        }
}
