az account set -s <subscriptionId>

crispycoffee_keyvault=crispycoffee-dev

while IFS=, read -r cert_name 
do
    az keyvault secret download -n $cert_name --file ./certs/$cert_name.pfx --vault-name $crispycoffee_keyvault --encoding base64
    echo "$cert_name" 
done < certs_names.txt 
