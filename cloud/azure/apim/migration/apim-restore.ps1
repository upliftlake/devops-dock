#New-AzStorageAccount -StorageAccountName "ContosoStorage" -Location $location -ResourceGroupName "ContosoGroup02" -Type Standard_LRS

$storageKey = (Get-AzStorageAccountKey -ResourceGroupName "rg-crispycoffee-sandbox" -StorageAccountName "attemptcrispycoffeesanboxdodo")[0].Value
$storageContext = New-AzStorageContext -StorageAccountName "attemptcrispycoffeesanboxdodo" -StorageAccountKey $storageKey

Restore-AzApiManagement -ResourceGroupName "rg-crispycoffee-sandbox" -Name "apimattemptcrispycoffeedev" -StorageContext $StorageContext -SourceContainerName "apims" -SourceBlobName "crispycoffeedevapi.apimbackup"
