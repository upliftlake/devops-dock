kubectl config use-context aks-dev


helm upgrade \
    --install nginx-ingress ingress-nginx/ingress-nginx \
    --namespace nginx-ingress \
    --set controller.defaultTLS.secret=some-tls-secret \
    --set controller.replicaCount=2 \
    -f internal-ingress-aks-dev.yaml \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.enableCustomResources=true \
    --set controller.enableTLSPassthrough=true \
    --set controller.healthStatus=true \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.admissionWebhooks.patch.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz
