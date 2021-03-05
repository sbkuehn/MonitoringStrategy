<#
Created 
2019.06.25
Shannon Kuehn
Last Updated
© 2019 Microsoft Corporation. 
All rights reserved. Sample scripts/code provided herein are not supported under any Microsoft standard support program 
or service. The sample scripts/code are provided AS IS without warranty of any kind. Microsoft disclaims all implied 
warranties including, without limitation, any implied warranties of merchantability or of fitness for a particular purpose. 
The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no event 
shall Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for 
any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of 
business information, or other pecuniary loss) arising out of the use of or inability to use the sample scripts or 
documentation, even if Microsoft has been advised of the possibility of such damages.
#>

# Checks all existing Log Analytics workspaces to determine if they have been configured with a resource context access mode.
Get-AzResource -ResourceType Microsoft.OperationalInsights/workspaces -ExpandProperties `
| foreach {$_.Name + ": " + $_.Properties.features.enableLogAccessUsingOnlyResourcePermissions}

# Configures 1 Log Analytics workspace in a resource context access mode.
$workspaceName = "{Log Analytics Workspace Name}"
$workspace = Get-AzResource -Name $workspaceName -ExpandProperties
if ($workspace.Properties.features.enableLogAccessUsingOnlyResourcePermissions -eq $null) 
    { $workspace.Properties.features | Add-Member enableLogAccessUsingOnlyResourcePermissions $true -Force }
else 
    { $workspace.Properties.features.enableLogAccessUsingOnlyResourcePermissions = $true }
Set-AzResource -ResourceId $workspace.ResourceId -Properties $workspace.Properties -Force

# Configures all Log Analytics workspaces in a resource context access mode.
Get-AzResource -ResourceType Microsoft.OperationalInsights/workspaces -ExpandProperties | foreach {
if ($_.Properties.features.enableLogAccessUsingOnlyResourcePermissions -eq $null) 
    { $_.Properties.features | Add-Member enableLogAccessUsingOnlyResourcePermissions $true -Force }
else 
    { $_.Properties.features.enableLogAccessUsingOnlyResourcePermissions = $true }
Set-AzResource -ResourceId $_.ResourceId -Properties $_.Properties -Force }
