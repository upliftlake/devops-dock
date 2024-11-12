#attach the sp to the container registry

az role assignment create --assignee <clientID from the json of sp> --role Contributor --scope /subscriptions/<SubscriptionID>/resourceGroups/<RgName>/providers/Microsoft.ContainerRegistry/registries/<RegistryName>


#update container registry to the aks
az aks update-credentials -g <RgName> -n <AksClusterName> --reset-service-principal --service-principal <SpFromJSON> --client-secret <ClientSecretFromJSON>