# terraform-json-tagging

With out knowing Json reponse strucutre, it's not easy to extract and tag especially in hasicorp configuaration language which is not a Turing Complete language.

Modules work perfectly fine for simple json reponses (which consists of simple json responses). Modules also work for complex json responses (wchich consists of key-value pairs, lists and nested objects) but it doesn't support if value is a number (regex need to be modified accordingly) and it doesn't support if key-value is a list (will depend on situation what value is needed out of a list). 


./infrastructure directory is the working directory for terraform

./modules directory houses all the modules (linux_function_app, cosmosdb and redis)

./infrastructure_old and ./json-experiments directories are for test workplaces. Reason for including them is beacuse they have some logic which can be useful to further enhance this repo.

All modules are written independent of each other. terraform.tfvars control the entire configuration. Even if you exclude the terraform.tfvars it will still work since i have given default values everywhere.

I have clubbed storage account, application insights, service plan and function app together in single module.

the main resource group is created under infrastructure/main.tf file.
