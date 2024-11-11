az account set -s crispycoffee-a4df-crispycoffee-ad6d-crispycoffee

Dest_Kv_Name="test-sp"

while IFS=, read -r secretName secretValue
do
    SECRET_CHECK=$(az keyvault secret list --vault-name $Dest_Kv_Name --query "[?name=='$secretName']" -o tsv)
    if [ -n "$SECRET_CHECK" ]
    then
        echo "$secretName already exists in $Dest_Kv_Name"
    else
        echo "Copying $secretName from Source KeyVault: $Source_Kv_Name to Destination KeyVault: $Dest_Kv_Name"
        az keyvault secret set --vault-name $Dest_Kv_Name -n $secretName --value "$secretValue" >/dev/null
    fi
done < keyvault.csv