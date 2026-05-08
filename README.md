**Terraform Compute Runtime (OCI + Jenkins)**

This project automatically provisions a VM on Oracle Cloud Infrastructure (OCI) using Terraform and bootstraps a custom Jenkins instance from a GitHub repository during the first VM startup.

The goal is simple:

```bash
terraform apply
```

And everything is automatically configured:

- network creation (VCN, subnet, internet gateway, route table, security list)
- compute instance creation
- Docker Engine installation
- Jenkins repository cloning
- custom image build
- Jenkins startup
- port 8080 exposure

---

**Architecture**

```text
Terraform
   ↓
OCI Network
   ↓
OCI Compute VM
   ↓
Cloud-init
   ↓
Docker Engine
   ↓
Git clone Jenkins repo
   ↓
Docker Compose
   ↓
Jenkins running
```

---

**Project Structure**

```text
terraform-compute-runtime/
├── envs/
│   └── oci/
│       ├── local/
│       │   ├── main.tf
│       │   ├── terraform.tfvars
│       │   └── cloud-init/
│       │       └── jenkins.yaml
│       └── dev/
│
├── modules/
│   └── oci/
│       ├── compute-runtime/
│       └── network/
│
└── README.md
```

---

**Requirements**

- Oracle Cloud Infrastructure account
- OCI API keys configured
- Terraform installed
- SSH access configured
- Jenkins repository available on GitHub

---

**Important Variables (`terraform.tfvars`)**

```hcl
region           = "sa-saopaulo-1"
tenancy_ocid     = "..."
user_ocid        = "..."
fingerprint      = "..."
private_key_path = "..."
ssh_public_key   = "..."

app_name = "jenkins"
app_port = 8080
env      = "local"
```

---

**Cloud-init (`jenkins.yaml`)**

During the first VM boot:

- installs Docker CE
- enables Docker
- clones Jenkins repository
- executes `docker compose up -d --build`
- opens port 8080 using firewalld

---

**Provision Infrastructure**

```bash
terraform init
terraform plan
terraform apply
```

---

**Get Public IP**

```bash
terraform output public_ip
```

---

**Connect via SSH**

```bash
ssh -i ~/.ssh/id_ed25519 opc@PUBLIC_IP
```

---

**Validate Jenkins**

```bash
docker ps
```

Open in browser:

```text
http://PUBLIC_IP:8080
```

---

**Issues Already Solved**

- duplicated VCN cleanup
- SSH key issues
- manual Terraform instance import
- Podman vs Docker conflict
- `docker-compose` vs `docker compose`
- internal firewall blocking port 8080
- automated Jenkins bootstrap

---

**Destroy Infrastructure**

```bash
terraform destroy
```

---

**Future Improvements**

- HTTPS
- custom domain
- Jenkins volume backup
- move secrets outside repository
- dynamic Jenkins agents

---

**Final Result**

Reusable infrastructure:

```bash
terraform apply
```

→ fully automated cus