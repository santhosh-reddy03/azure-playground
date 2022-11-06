Import-Module -Name Az


# New-AzVm -ResourceGroupName $RGName -Name $vmname -Credential (Get-Credential) -Location "centralindia" -Image UbuntuLTS -OpenPorts 22 -PublicIpAddressName "testvm-01"
# $vm = (Get-AzVM -Name $vmname -ResourceGroupName $RGName)
# Get-AzPublicIpAddress -ResourceGroupName $RGName -Name $vmname


#variables
$demo_varaible = "this is a variable starts with $"
$iterations = 3

# variables are capable of storing objects as well, ex adminCredentials defined below
# they are access by using the $var_name
Connect-AzAccount

$vmName = "vm-automate-test"

$resourceGroup = "vm-test-rg"

$adminCredentials = Get-Credential -Message "enter a username and password for vm admin"

$loc = "centralindia"
New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredentials -Location $loc -Image UbuntuLTS -OpenPorts 22 -PublicIpAddressName "testvm-01"


#.\deployvm.ps1 to execute the script
# powershell supports for, do while, for each loops etc
# powershell uses similar comparision ops like -lt, -eq, -ne as in bash
# to pass keyword arguments whem running script .\setupEnvironment.ps1 -size 5 -location "East US"
# to capture arguments passed used the syntax below
# param([string]$location, [int]$size)

# if we pass arguments wihtout keys we need to capture them in order inside script
# param([string]$location, [int]$size) to capture .\script.ps1 us 5





