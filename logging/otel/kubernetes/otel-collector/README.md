# Deploy OtenTelemetry Collector in Kubernetes

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install otel-collector open-telemetry/opentelemetry-collector --values values-ds.yaml -n datadog
helm install otel-collector-cluster open-telemetry/opentelemetry-collector --values values-deploy.yaml -n datadog


## for daemonset
helm install ds-otel-col open-telemetry/opentelemetry-collector --values k8s-values-ds.yaml -n attempt-datadog

## for deployment
helm install deploy-otel-col open-telemetry/opentelemetry-collector --values k8s-values-deploy.yaml -n attempt-datadog


https://opentelemetry.io/docs/kubernetes/getting-started/