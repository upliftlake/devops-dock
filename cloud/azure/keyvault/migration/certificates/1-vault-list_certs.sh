az account set -s <subscriptionId>
az keyvault certificate list --vault-name crispycoffee-dev --query "[].name" -o tsv >> certs_names.txt