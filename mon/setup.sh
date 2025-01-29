# namespace
kubectl create namespace mon

# Install Prometheus + Grafana
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update
helm install -n mon prometheus-grafana prometheus-community/kube-prometheus-stack \
  --set grafana.adminUser=admin \
  --set grafana.adminPassword=fmi-monitoring \
  --namespace=mon
helm upgrade -n mon prometheus-grafana prometheus-community/kube-prometheus-stack \
  --set grafana.adminUser=admin \
  --set grafana.adminPassword=fmi-monitoring \
  --namespace=mon

# Mountfiles
kubectl create configmap mountfiles \
  --from-file mountfiles -o yaml \
  --dry-run=client | kubectl apply -f - -n mon

kubectl apply -f mon.yaml
