Go to datadog portal > Add Agent > Kubernetes

helm repo add datadog https://helm.datadoghq.com
helm repo update
helm install datadog-operator datadog/datadog-operator -n datadog

kubectl apply -f datadog-secret -n datadog

## no need to install operator
## incase of helm installation
helm install datadog-agent -f datadog-values.yaml datadog/datadog -n datadog

## install the datadog-operator first in this case
## incase of from file installation 
kubectl apply -f datadog-agent.yaml -n datadog

