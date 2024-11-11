az account set -s crispycoffee-a4df-crispycoffee-ad6d-crispycoffee

Source_Kv_Name="sp-test"

SECRETS+=($(az keyvault secret list --vault-name $Source_Kv_Name --query "[].id" -o tsv))

for SECRET in "${SECRETS[@]}"; do
SECRETNAME=$(echo "$SECRET" | sed 's|.*/||')
SECRET_CHECK="10"
#if [ -n "$SECRET_CHECK" ]
if [ $SECRET_CHECK -eq 8 ]
then
    echo "$SECRETNAME already exists in $Dest_Kv_Name"
else
    echo "Copying $SECRETNAME from Source KeyVault: $Source_Kv_Name to Destination KeyVault: $Dest_Kv_Name"
    SECRET=$(az keyvault secret show --vault-name $Source_Kv_Name -n $SECRETNAME --query "value" -o tsv)
    echo $SECRETNAME, $SECRET >> ./keyvault.csv
fi
done