# Cloud-1 Automated WordPress Deployment

This project automates the deployment of a containerized WordPress stack using **Ansible** and **Docker Compose**, as part of the **42 Cloud-1 project**.

---

## 📦 Stack Components

- **Docker** + **Docker Compose**
- **WordPress** (custom build)
- **MariaDB** (database backend)
- **phpMyAdmin** (DB UI)
- **Nginx** (TLS reverse proxy)
- **Ansible** for provisioning

---

## 📁 Directory Structure

```

.
├── site.yaml               # Main Ansible playbook
├── inventory.yaml          # Ansible inventory
├── group\_vars/
│   └── all.yml             # Shared variables (DB credentials, WP config, etc.)
├── roles/
│   ├── common/             # Docker installation
│   ├── mariadb/            # DB container setup
│   ├── wordpress/          # WP container and build
│   ├── phpmyadmin/         # PhpMyAdmin service
│   ├── nginx/              # Reverse proxy and TLS
│   └── stack/              # Generates docker-compose.yml

````

---

## 🚀 Usage

### 1. Configure your secrets and environment

Create and edit the file `group_vars/all.yml` with your desired credentials:

```yaml
MYSQL_USER: myuser
MYSQL_PASSWORD: mypassword
MYSQL_DATABASE: wordpress_db
DB_HOST: mariadb


WP_ADMIN_LOGIN: admin
WP_ADMIN_EMAIL: admin@example.com
WP_ADMIN_PASSWORD: adminpass

WP_AUTHOR_LOGIN: author
WP_AUTHOR_EMAIL: author@example.com
WP_AUTHOR_PASSWORD: authorpass
````

---

### 2. Add Self-Signed SSL Certificates

Place the following files in:

```

roles/nginx/files/certs/
├── selfsigned.crt   # Self-signed public certificate
├── selfsigned.key   # Corresponding private key

````

You can generate them using:

```bash
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout selfsigned.key \
  -out selfsigned.crt \
  -subj "/C=MA/ST=42/L=School/O=Cloud1/CN=example.com"
````

---

### 3. Add your target host

Edit `inventory.yaml` with the IP or domain of your cloud instance:

```yaml
all:
  hosts:
    myserver:
      ansible_host: YOUR.SERVER.IP
```

---

### 4. Deploy the stack

Use `make` to deploy:

```bash
make deploy
```
---

## 🛠️ Features

* Idempotent Ansible roles
* TLS via custom certs
* Isolated containers (1 process = 1 container)
* Persistent volumes using bind mounts

---

## 🔐 Security

* Only ports 80 and 443 are exposed publicly
* MariaDB is not accessible externally
* Secrets are managed via `group_vars` and never hard-coded
* SSL certificates are stored securely under `roles/nginx/files/certs/`

---
