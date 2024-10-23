
# for otel
kubectl apply -f dd-secrets.yaml

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install my-otel-demo open-telemetry/opentelemetry-demo --values my-values-file.yml -n datadog

# dd agent is not needed to export to datadog
