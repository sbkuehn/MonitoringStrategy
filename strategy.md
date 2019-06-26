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
Scope for configuration of settings like pricing tier, retention, and data capping.
Charges related to data ingestion and retention are made on the workspace resource.
From a consumption point of view, the best go forward strategy is to limit the total amount of workspaces required for daily operations. 
Reducing the number of workspaces can make administration and query experience easier and quicker. 

Many times multiple workspaces are required if:
1) You are a global company and you need log data stored in specific regions for data sovereignty or compliance reasons.
2) You are using Azure and you want to avoid outbound data transfer charges by having a workspace in the same region as the Azure resources it manages.
3) You are a managed service provider and need to keep the Log Analytics data for each customer you manage isolated from other customer’s data.
4) You manage multiple customers and you want each customer / department / business group to see their own data, but not data from others, and there is no business need for a consolidated cross customer / department / business group view.

Picking an access mode should be a straightforward process based upon business need. Whether it be a workspace-centric or resource-centric model, once the workspace architecture/permissions are defined, enforcement via Azure Policy and automation will help ensure operations resources are being monitored related to metrics, diagnostics, and alerts. 

