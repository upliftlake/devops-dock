# managed identity is used to connect resources within azure


```sh
#enable managed identity
$ az aks update --resource-group <RgName> --name <AksClusterName> --enable-managed-identity

$ CLIENT_ID=$(az aks show --name <RgName> --resource-group <AksClusterName> --query identity.principalId --output tsv)

$ az role assignment create --assignee $CLIENT_ID --role "acrpull" --scope "/subscriptions/<SubscriptionID>/resourceGroups/<RgName>/providers/Microsoft.ContainerRegistry/registries/<RegistryName>"

####but aks will not be able to pull from acr, for that update the node####
$ az aks nodepool upgrade --resource-group <AksClusterName> --cluster-name <RgName> --name <NodePoolName> --node-image-only



####if it doesn't work after running the above commands, check connections running the commands below####


#show vmss identity
$ az vmss identity show --resource-group <RgNameOfVmss> --name <VmssName>

#check acr connection
$ az aks check-acr --name aks-crispycoffee-dev-stg --resource-group <RgName> --acr /subscriptions/<SubscriptionID>/resourceGroups/<RgName>/providers/Microsoft.ContainerRegistry/registries/<RegistryName>

#check role assignment
az role assignment list --assignee $identityResourceId --scope /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.ContainerRegistry/registries/$ACR_NAME
The provided client secret keys for app 'secret-key' are expired.

$ az role assignment list --assignee 1b793386-c515-4946-8ac2-69b380834e29 --scope /subscriptions/<SubscriptionID>/resourceGroups/<RgName>/providers/Microsoft.ContainerRegistry/registries/<RegistryName>
```
