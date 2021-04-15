# Access Modes 
This new feature refers to how users access Log Analytics workspaces in each environment. Customers are now able to define the 
scope of data users can access. As of March 2019, there are 2 different Access Modes: <i>workspace-context</i> and <i>resource-context</i>.

**Workspace-context:**
In this mode, a user can view all logs in whatever workspace that they hold Reader permissions. Queries in this mode are scoped
to all data in all tables within the workspace. This access mode is used when logs are accessed with the workspace as the 
scope. For example, if you select Logs from the Azure Monitor menu in the Azure portal, you are using a workspace-centric
method of viewing logs.
<br><i>USE CASES:</i> Central IT, Operations

**Resource-context:**
When users access the workspace for a particular resource, such as when you select Logs from a resource menu in the Azure 
portal, you can view logs for only that resource in all tables that you have access to. Queries in this mode are scoped to only
data associated with that resource. This mode also enables granular role-based access control (RBAC).
<br><i>USE CASES:</i> Application/Middleware Teams, DevOps Teams, Separation of Business Units
