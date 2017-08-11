$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

$username = Read-Host -Prompt 'Write username'
$password = Read-Host -Prompt 'Write password'
$version = $PSVersionTable.PSVersion.major

IF(Test-Path $registryPath) {
	Set-ItemProperty -Path $registryPath -Name "AutoAdminLogon" -Value "1"
	IF($version -qe 5) {
		$test = Get-ItemPropertyValue -Path $registryPath -Name "AutoAdminLogon"
		IF($test -eq 1) {
			Write-Host "AutoAdminLogon successfully set to 1"
		} ELSE {
			Write-Host "Error while changing AutoAdminLogon value"
			Write-Host "Current value is" $test
		}
	}

	Set-ItemProperty -Path $registryPath -Name "DefaultUserName" -Value $username
	IF($version -qe 5) {
		$test = Get-ItemPropertyValue -Path $registryPath -Name "DefaultUserName"
		IF($test -eq $username) {
			Write-Host "DefaultUserName successfully set to" $username
		} ELSE {
			Write-Host "Error while changing DefaultUserName value"
			Write-Host "Current value is" $test
		}
	}

	Set-ItemProperty -Path $registryPath -Name "DefaultPassword" -Value $password
	IF($version -qe 5) {
		$test = Get-ItemPropertyValue -Path $registryPath -Name "DefaultPassword"
		IF($test -eq $password) {
			Write-Host "DefaultPassword successfully set to " $password
		} ELSE {
			Write-Host "Error while changing DefaultPassword value"
			Write-Host "Current value is" $test
		}Trenutna vrednost
	}

	Set-ItemProperty -Path $registryPath -Name "DefaultDomainName" -Value "ad"
	IF($version -qe 5) {
		$test = Get-ItemPropertyValue -Path $registryPath -Name "DefaultDomainName"
		IF($test -eq "ad") {
			Write-Host "DefaultDomainName successfully set to ad"
		} ELSE {
			Write-Host "Error while changing DefaultDomainName value"
			Write-Host "Current value is" $test
		}
	}
} ELSE {
	Write-Host "Path does not exist"
}
Write-Host "Finished"
