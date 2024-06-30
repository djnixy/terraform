resource_group_name           = "rg-productdemo-development-eastau"
automation_account_name       = "aa-productdemo-development"
region                        = "australiaeast"

azure_blob_container_name     = "productdemo-development-backup"
azure_blob_storage_endpoint   = "https://productdemo.blob.core.windows.net"
# azure_database_admin_username = ""
# azure_database_admin_password = ""
azure_database_names          = "sqldb-core-development-eastau,sqldb-environment-development-eastau"
azure_database_server_name    = "sql-productdemo-development-eastau"
backup_retention_days         = 3
storage_account_name          = "productdemo"
# azure_storage_key             = ""
role_assignment_scope         = "/subscriptions/xxxxxxxx/resourceGroups/rg-productdemo-development-eastau/providers/Microsoft.Sql/servers/sql-productdemo-development-eastau"