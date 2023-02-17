resource_group_name     = "sai-lab-2"
resource_group_location = "East US"


storage_account_name      = "sailab79"
storage_account_tier      = "Standard"
account_replication_type  = "LRS"
enable_https_traffic_only = true

app_insight_name     = "linux-function-app-insights"
app_insight_app_type = "web"

service_plan_name     = "linux-function-app-service-plan"
service_plan_kind     = "Linux"
service_plan_reserved = true
service_plan_sku_tier = "Standard"
service_plan_sku_size = "S1"

function_app_name       = "linux-function-app"
function_only_https     = true
function_python_version = 3.9

cosmosdb_account_name               = "cosmos-db"
cosmosdb_account_offer_type         = "Standard"
cosmosdb_account_kind               = "GlobalDocumentDB"
cosmosdb_account_automatic_failover = true
consistency_level                   = "BoundedStaleness"
max_interval_in_seconds             = 300
max_staleness_prefix                = 100000
first_failover_location             = "East US"
second_failover_location            = "West US"

sql_db_name       = "cosmos-sql-db"
sql_db_throughput = 400

sql_container_name       = "cosmos-sql-container"
sql_container_throughput = 400
partition_key_version    = 1
partition_key_path       = "/studentid"


redis_cache_name            = "redis-cache"
redis_cache_capacity        = 2
redis_cache_family          = "C"
redis_cache_sku             = "Standard"
redis_cache_ssl_port        = false
redis_cache_min_tls_version = 1.2

tags_simple_url = "https://api.agify.io?name=bella"
tags_complex_url = "https://api.coindesk.com/v1/bpi/currentprice.json"