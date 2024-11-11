#!/bin/bash

#Provide the subscription Id where snapshot is created
subscriptionId="crispycoffee-a4df-crispycoffee-ad6d-crispycoffee"

#Provide the name of your resource group where snapshot is created
resourceGroupName="srg-crispycoffee"

#Provide the snapshot name
snapshotName="ss-crispycoffee"

#Provide Shared Access Signature (SAS) expiry duration in seconds e.g. 3600.
#Know more about SAS here: https://docs.microsoft.com/en-us/azure/storage/storage-dotnet-shared-access-signature-part-1
sasExpiryDuration=36000

#Provide storage account name where you want to copy the snapshot.
storageAccountName="storage-crispycoffee"

#Name of the storage container where the downloaded snapshot will be stored
storageContainerName="container-crispycoffee"

#Provide the key of the storage account where you want to copy snapshot.
storageAccountKey="5MZOFm6pkrnYlewayhuhrfoaiuhf987u72314y645981767y498i7jnxbzkwR3rzA2YWmd1I1+ASt0Iq6rw=="

#Provide the name of the VHD file to which snapshot will be copied.
destinationVHDFileName="ss-crispycoffee-071122-vhd.vhd"

az account set --subscription $subscriptionId

sas=$(az snapshot grant-access --resource-group $resourceGroupName --name $snapshotName --duration-in-seconds $sasExpiryDuration --query [accessSas] -o tsv)

az storage blob copy start --destination-blob $destinationVHDFileName --destination-container $storageContainerName --account-name $storageAccountName --account-key $storageAccountKey --source-uri $sas
