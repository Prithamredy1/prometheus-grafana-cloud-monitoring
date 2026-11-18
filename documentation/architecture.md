# Architecture
| Component | Port | Role |
|---|---|---|
| Node Exporter v1.8.2 | 9100 | Exposes `/metrics` for the VM (host network, host PID, `/` mounted read-only at `/host`) |
| Prometheus v2.53.0 | 9090 | Scrapes every 15 s, stores 15 days, evaluates `alerts.yml` |
| Grafana 11.2.0 | 3000 | Datasource and dashboard provisioned from files |

Node Exporter uses the host network so interface and network metrics reflect the VM. Prometheus reaches it through `host.docker.internal` (mapped to the host gateway). **Firewall tip:** allow port 9100 only from the Docker subnet, not the whole network (`sudo ufw allow from 172.16.0.0/12 to any port 9100`).
Recommended VM: 2 vCPU, 3 GB RAM, 30-40 GB disk, no desktop GUI.
