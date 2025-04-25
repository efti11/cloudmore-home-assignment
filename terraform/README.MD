# Cloudmore DevOps Home Assignment

This repo spins up an Ubuntu 22.04 VM on Azure, installs Docker, and runs:
- Prometheus
- Grafana
- A custom "Tallinn temperature" exporter

### Prerequisites

- Azure CLI installed & `az login`
- Terraform ≥ 1.0

## Terraform Remote Backend

This project uses an **Azure Storage Account as a remote backend** to store Terraform state so you ll have to set your own storage_account_name and container on this storage account (see terraform/backend.tf)

### Quickstart

1. `cd terraform`
2. Edit `variables.tf`, set `admin_password`
3. `terraform init && terraform apply`
4. Note the VM public IP from the output
5. In browser:
   - Prometheus → `http://<IP>:9090`
   - Grafana → `http://<IP>:3000` (login `admin/admin`)
6. Import dashboard: `grafana/dashboards/tallinn_temperature.json`
7. When done: `terraform destroy`

## Access After Deployment

Service	URL
Exporter: 	http://172.201.177.65:8000/metrics
Prometheus:	http://172.201.177.65:9090
Grafana:	   http://172.201.177.65:3000 (login: admin/admin)