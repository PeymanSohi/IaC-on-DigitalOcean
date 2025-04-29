# 🌐 Terraform DigitalOcean Droplet + Ansible Configuration

This project introduces Infrastructure as Code (IaC) using **Terraform** to provision a Linux Droplet on **DigitalOcean**, and optionally uses **Ansible** to configure the server after provisioning.

---

## 🔧 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) (optional)
- A [DigitalOcean account](https://cloud.digitalocean.com/)
- A DigitalOcean **API Token**
- An **SSH key pair** on your local machine

---

## 🔐 Setup Your Environment

1. **Clone this repo**  
   ```bash
   git clone https://github.com/peymansohi/iac-on-digitalocean.git
   cd terraform-do-droplet
   ```

2. **Generate SSH Key** (if you don't have one)  
   ```bash
   ssh-keygen -t rsa -b 4096
   ```

3. **Edit `terraform.tfvars` with your values:**

```hcl
do_token       = "your_digitalocean_api_token"
ssh_key_name   = "terraform-key"
ssh_public_key = file("~/.ssh/id_rsa.pub")
```

---

## 🚀 Terraform Usage

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Review the plan**
   ```bash
   terraform plan
   ```

3. **Apply to create the Droplet**
   ```bash
   terraform apply
   ```

4. **Access your server**
   After apply, you’ll get the IP of the server:
   ```bash
   ssh root@<DROPLET_IP>
   ```

---

## 🛠️ Stretch Goal: Configure Server with Ansible

1. **Edit Ansible Inventory: `ansible/hosts`**
```ini
[droplets]
your_droplet_ip ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa
```

2. **Edit Ansible Playbook: `ansible/playbook.yml`**
```yaml
- name: Configure server
  hosts: all
  become: yes
  tasks:
    - name: Update APT packages
      apt:
        update_cache: yes
        upgrade: dist
```

3. **Run the playbook**
   ```bash
   cd ansible
   ansible-playbook -i hosts playbook.yml
   ```

---

## 🧹 Destroy Infrastructure

```bash
terraform destroy
```

---

## 📚 Resources

- [Terraform DigitalOcean Provider Docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)
- [DigitalOcean API Tokens](https://cloud.digitalocean.com/account/api/tokens)
- [Ansible Getting Started Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)

---

## 🔒 Security Notes

- **Never commit `terraform.tfvars`** with your API token
- Use `.gitignore` to exclude it:

```
terraform.tfvars
*.tfstate
```

---

## ✅ Done!

You now have a working infrastructure setup using Terraform and optional Ansible configuration for automation. Great job!

```

---

https://roadmap.sh/projects/iac-digitalocean