#sp is used to connect from outside of azure
#Create a service principal to access your resource group with the Contributor role using the following command,
#Follow the naming convention given in Name

Name="sp_projectName_createDate"
Subscription="/subscriptions/<SubscriptionID>/resourceGroups/<RgName>"

az ad sp create-for-rbac \
    --name $Name \
    --scope $Subscription \
    --role Contributor \
    --years 99999 \
    --sdk-auth

#Copy the json