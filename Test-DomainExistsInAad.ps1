Function Test-DomainExistsInAad {

      param(

             [Parameter(mandatory=$true)]

             [string]$DomainName

       )

      $response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/getuserrealm.srf?login=user@$DomainName&xml=1"

     if($response -and $response.StatusCode -eq 200) {

           $namespaceType = ([xml]($response.Content)).RealmInfo.NameSpaceType

           if ($namespaceType -eq "Unknown")
           {
                return $false
           }
           else{
                return $true
           }

    } else {

        Write-Error -Message 'Domain could not be verified. Please check your connectivity to login.microsoftonline.com'

    }

}
