# CI/CD Project Using Jenkins, GitHub, Ansible, Docker, and Tomcat

## Project Overview

This project demonstrates a simple CI/CD pipeline using Jenkins, GitHub, Ansible, Docker, and Tomcat.

The main purpose of the project is to automate application deployment from source code repository to a running containerized environment.

The project uses three separate servers:

* **Jenkins Server** → handles build automation
* **Ansible Server** → handles deployment automation
* **Docker Server** → runs the application inside a container

---

## Project Flow

```text id="rd1k72"
GitHub → Jenkins → Ansible → Docker → Browser
```

---

## Technologies Used

* Jenkins
* GitHub
* Git
* Ansible
* Docker
* Tomcat

---

## Repository Files

This repository contains:

```text id="l0lr0w"
Dockerfile
index.html
style.css
```

---

## Why Maven Was Not Used

Maven is generally used for Java projects to generate `.war` or `.jar` files.

Since this project contains only static files (`HTML` and `CSS`), Maven was configured in Jenkins environment but not used in the deployment process.

---

## Jenkins Configuration

A freestyle job was created in Jenkins.

### Source Code Management

Git repository URL was added.

Branch used:

```text id="zih8wu"
main
```

### Build Step

Shell command used:

```bash id="zdg17a"
pwd
ls -l
```

This verifies that Jenkins has successfully cloned the repository.

---

## Jenkins Post Build Configuration

The **Publish Over SSH** plugin was used.

### Files transferred to Ansible server

```text id="i5s7f2"
Dockerfile,index.html,style.css
```

### Remote directory

```text id="1m2s2k"
opt/docker
```

### Execution command

```bash id="xyqjlwm"
cd /opt/project && ansible-playbook create-docker-container.yml
```

---

## Ansible Configuration

Ansible files were created inside:

```bash id="zvt9m3"
/opt/project
```

### inventory file

```ini id="ivf9wl"
[docker]
docker-node1
```

### ansible.cfg

```ini id="j95x3j"
[defaults]
inventory=/opt/project/inventory
remote_user=itadmin
host_key_checking=false

[privilege_escalation]
become=true
become_user=root
become_method=sudo
become_ask_pass=false
```

---

## Deployment Playbook

The playbook performs:

* Docker installation verification
* Docker service start
* Copy files to Docker server
* Remove old container
* Remove old image
* Build new Docker image
* Run new container

---

## Dockerfile Used

```dockerfile id="m3vr0v"
FROM tomcat:9

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY index.html /usr/local/tomcat/webapps/ROOT/
COPY style.css /usr/local/tomcat/webapps/ROOT/
```

---

## Why Tomcat Was Used

Tomcat serves web content from:

```text id="5jwgrt"
/usr/local/tomcat/webapps/ROOT
```

Static files were copied directly into ROOT so the application loads immediately.

---

## Docker Deployment Result

Docker image created:

```text id="cz0n2n"
myapp:latest
```

Docker container created:

```text id="h6s37t"
webapp
```

Port mapping used:

```text id="ekvq5x"
8081:8080
```

Port 8081 was selected because Jenkins already uses port 8080.

---

## Verification Commands

### On Docker Server

```bash id="dhlvxh"
docker images
docker ps
```

---

## Browser Access

```text id="t9ixzz"
http://<docker-server-ip>:8081
```

---

## Final Outcome

The project successfully achieved automatic deployment through Jenkins.

After each build:

* Latest code is pulled from GitHub
* Files are transferred to Ansible server
* Ansible deploys to Docker server
* Docker container is updated

---

## Final CI/CD Flow

```text id="9rfkhe"
GitHub → Jenkins → Ansible → Docker → Browser
```
