# Mount Key Vault Secret to a Kubernetes Pod

## Steps
```sh
az aks enable-addons --addons azure-keyvault-secrets-provider --name aks-dev-stg --resource-group rg-sandbox
```
After enable-addons, two user-assigned-managed-identities will be created in the same rg as the vmss
go to the managed-identity > 'Azure Role Assignments' > + > 'Add role assignment' > + Scope - Key Vault > Resource - (select) kvName > Role - Contributor > [Save]

```sh
kubectl get pods -n kube-system -l 'app in (secrets-store-csi-driver,secrets-store-provider-azure)'

k apply -f secretProviderClass.yaml

k apply -f busybox.yaml

k exec -ti busybox-secrets-store-inline-system-msi -- cat /mnt/secrets-store/mySecret
```

## Resources
```sh
https://www.youtube.com/watch?v=8l9LRcUw3pA
https://shailender-choudhary.medium.com/access-secrets-from-azure-key-vault-in-azure-kubernetes-service-e8efffe49427

```