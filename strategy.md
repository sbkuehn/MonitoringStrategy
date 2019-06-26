<b>Determine the number of workspaces you need</b>
<br>A Log Analytics workspace becomes a container where data is collected, aggregated, analyzed, and presented in Azure Monitor. 
Customers can have multiple workspaces per Azure subscription, and can have access to more than one workspace, with the ability
to easily query across multiple workspaces. 
<br>
A Log Analytics workspace provides:
<br>
A geographic location for data storage.
Data isolation to define different user access rights in workspace-centric mode (not relevant when working in resource-centric 
mode).
Scope for configuration of settings like pricing tier, retention and data capping.
Charges related to data ingestion and retention are made on the workspace resource.
From a consumption point of view, the best go forward strategy is to limit the total amount of workspaces required. 
Reducing the number of workspaces can make administration and query experience easier and quicker. 

But, based on the preceding characteristics, you may want to create multiple workspaces if:

You are a global company and you need log data stored in specific regions for data sovereignty or compliance reasons.
You are using Azure and you want to avoid outbound data transfer charges by having a workspace in the same region as the Azure resources it manages.
You are a managed service provider and need to keep the Log Analytics data for each customer you manage isolated from other customer’s data.
You manage multiple customers and you want each customer / department / business group to see their own data, but not data from others, and there is no business need for a consolidated cross customer / department / business group view.”.
When using Windows agents to collect data, you can configure each agent to report to one or more workspaces.

If you are using System Center Operations Manager, each Operations Manager management group can be connected with only one workspace. You can install the Microsoft Monitoring Agent on computers managed by Operations Manager and have the agent report to both Operations Manager and a different Log Analytics workspace.

Once the workspace architecture is defined, you should enforce this policy on Azure resources with Azure Policy. This can provide a built-in definition that would automatically apply to all Azure resources. For example, you could set a policy to ensure that all your Azure resources in a particular region sent all their diagnostic logs to a particular workspace.

