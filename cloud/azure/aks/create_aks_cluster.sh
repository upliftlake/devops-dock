Resource_Group_Name="rg-crispycoffee-cloud"
Azure_Location="switzerlandnorth"

Vnet_Name="vnet-dev-crispycoffee"
Subnet_Name="snet-dev-aks"
Aks_Name="aks-dev"
Subnet_Id="/subscriptions/42240cc0-a4df-4c5d-ad6d-6733fa2d1d78/resourceGroups/rg-crispycoffee-cloud/providers/Microsoft.Network/virtualNetworks/vnet-dev-crispycoffee/subnets/snet-dev-aks"
K8s_Version="1.27.7"
Node_Count=2
Vm_Size="Standard_B4ms"
Max_Number_of_Nodes=15
Max_Number_Of_Pods=110

az aks create -g $Resource_Group_Name -n $Aks_Name --network-plugin azure --vnet-subnet-id $Subnet_Id --docker-bridge-address 172.17.0.1/16 --dns-service-ip 10.100.0.10 --service-cidr 10.100.0.0/16 -k $K8s_Version -c $Node_Count --max-pods $Max_Number_Of_Pods -s $Vm_Size --generate-ssh-keys 