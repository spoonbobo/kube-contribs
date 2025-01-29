# Wandb Kube

## Setup

### install helm chart
```bash
helm install local-wandb .  -n wandb
helm upgrade local-wandb .  -n wandb
```

### add ingress
```bash
echo "$(minikube ip) wandb.fake.appcara.com.hk"  # copy host to clipboard
sudo nano /etc/hosts
# add host to the end of the file
```

### Access wandb
`http://wandb.fake.appcara.com.hk/`

Create an account for your usage.

