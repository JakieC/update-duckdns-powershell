Param (
	[Parameter(
		Mandatory=$True,
		HelpMessage="Comma separate the domains if you want to update more than one."
	)]
	[ValidateNotNullOrEmpty()]
	[String]$domain,

	[Parameter(Mandatory=$True)]
	[ValidateNotNullOrEmpty()]
	[String]$token
)

$timestamp = (Get-Date).toString("dd/MM/yyyy HH:mm:ss")
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
try {
    $currentIPv4 = (Invoke-RestMethod 'https://ipv4.icanhazip.com/').Trim()
    $currentIPv6 = (Invoke-RestMethod 'https://ipv6.icanhazip.com/').Trim()   
    $url = 'https://www.duckdns.org/update?domains={0}&token={1}&ip={2}&ipv6={3}' -f $domain,$token,$currentIPv4,$currentIPv6
    $result = Invoke-RestMethod $url
    if ($result -ne 'OK') {
        Add-Content -Path $scriptPath\error.log -Value ($timestamp + ' Domain Update Fail')
    }
}
catch {
    Add-Content -Path $scriptPath\error.log -Value ($timestamp + ' ' + $Error[0])
}