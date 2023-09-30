---

# Distributed MinIO on Docker Swarm

This repository provides a Docker Compose configuration for deploying a distributed MinIO setup on Docker Swarm.

## Overview

MinIO is a high-performance, Kubernetes-native object storage suite. This configuration sets up a distributed MinIO cluster with four nodes, ensuring high availability and fault tolerance.

## Configuration Details

- **Volumes**: Each MinIO service instance has its own dedicated volume for data persistence. These volumes are managed by Docker with the local driver.
  
- **Ports**: The first MinIO instance (`minio1`) exposes ports `9000` and `9001` for external access. Port `9000` is the default MinIO port, while `9001` is used for MinIO's built-in console.

- **Environment Variables**: The configuration uses environment variables to set up the root user, enable distributed mode, and specify the nodes in the distributed setup.

- **Deployment**: The services are configured to run in Docker Swarm mode. Placement constraints ensure that each MinIO instance runs on a specific server, as defined by the server's hostname.

## Usage

### Prerequisites

- Docker and Docker Swarm should be installed and initialized.
- Ensure that the hostnames `{first_server_hostname}`, `{second_server_hostname}`, `{third_server_hostname}`, and `{fourth_server_hostname}` are correctly set up in your Swarm cluster.

### Deployment

1. Clone this repository:
   ```bash
   git clone https://github.com/PortySec/DockerDream.git
   cd DockerDream
   ```

2. Deploy the stack to Docker Swarm:
   ```bash
   docker stack deploy -c docker-compose.yml minio_stack
   ```

3. Access the MinIO console by navigating to `http://[host-ip]:9001`.

### Customization Options

- **Changing Hostnames**: If you wish to deploy the MinIO instances to different servers, modify the `node.hostname` constraints in the `docker-compose.yml` file.

- **Changing Root Credentials**: The default root user and password are set to `root` and `toor`, respectively. You can change these by modifying the `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD` environment variables.

- **Scaling**: By default, all MinIO instances have a replica count of 1, except for `minio2`, which has a replica count of 0. Adjust the `replicas` value under the `deploy` section if you wish to change this.

## Conclusion

This configuration provides a straightforward way to deploy a distributed MinIO setup on Docker Swarm. Ensure that you understand the placement constraints and adjust them according to your Swarm cluster's setup.

---
