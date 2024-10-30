# to create a resource

```sh
terraform init
```
```sh
terraform plan -out envResourceResourceName.txt
```
```sh
terraform apply "envResourceResourceName.txt"
```


# to modify a resource

modify the resource
```sh
terraform plan -out envResourceResourceName.txt
```
```sh
terraform apply "envResourceResourceName.txt"
```


# import the changes to the tf file

1. cd to the folder
2. remove the tf state file if there is any
```sh
tf state rm azurerm_linux_web_app.webapp
```
3. import the changes 
```sh
tf import azurerm_linux_web_app.webapp /subscriptions/sub-id/resourceGroups/rg-name/providers/Microsoft.Web/sites/webapp-name
```
4. change the tf file according to the imported differences


# destroy the resource

1. always plan the destroy for a safety net 
```sh
tf plan -destroy -out envResourceResourceName.txt
```
2. destroy the resource
```sh
terraform plan -destroy -out attemptgotenberg.txt
```