az account set -s <subscriptionId>

crispycoffee_keyvault=dev-crispycoffee

while IFS=, read -r cert_name 
do
    az keyvault certificate import -n $cert_name --file ./certs/$cert_name.pfx --vault-name $crispycoffee_keyvault
    echo "$cert_name" 
done < certs_names.txt 