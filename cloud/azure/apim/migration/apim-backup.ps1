#New-AzStorageAccount -StorageAccountName "ContosoStorage" -Location $location -ResourceGroupName "ContosoGroup02" -Type Standard_LRS

$storageKey = (Get-AzStorageAccountKey -ResourceGroupName "rg-crispycoffee" -StorageAccountName "storage-crispycoffee")[0].Value
$storageContext = New-AzStorageContext -StorageAccountName "storage-crispycoffee"" -StorageAccountKey $storageKey

Backup-AzApiManagement -ResourceGroupName "rg-crispycoffee" -Name "apim-crispycoffee" -StorageContext $StorageContext -TargetContainerName "container-crispycoffee" -TargetBlobName "apimcrispycoffee.apimbackup"
