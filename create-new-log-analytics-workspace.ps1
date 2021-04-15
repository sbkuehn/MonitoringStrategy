[CmdletBinding()]
    param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$true)]
    [string]$workspaceName,
    [Parameter(Mandatory=$true)]
    [string]$resourceGroupName
    )

New-AzResourceGroup -Location $location -Name $resourceGroupName
New-AzOperationalInsightsWorkspace -Location $location `
                                   -Name $workspaceName `
                                   -Sku PerGB2018 `
                                   -ResourceGroupName $resourceGroupName

$solutions = @('ADAssessment','AzureActivity','AzureNetworking','AgentHealthAssessment','InfrastructureInsights','KeyVaultAnalytics','NetworkMonitoring','AntiMalware',`
'AlertManagement','Security','ContainerInsights','Containers','DHCPActivity','DnsAnalytics','ServiceMap','SiteRecovery','SecurityCenterFree','SecurityInsights',`
'VMInsights','AgentHealthAssessment')

foreach ($solution in $solutions) {
    Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName -IntelligencePackName $solution -Enabled $true
}
