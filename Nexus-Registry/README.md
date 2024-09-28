# Nexus and HAProxy Docker Swarm Deployment

This repository contains a Docker Compose configuration for deploying Nexus Repository Manager and HAProxy on a Docker Swarm cluster.

## Prerequisites

- Docker and Docker Swarm initialized.
- Node labels set up in your Docker Swarm environment.

## Setup Instructions

1. **Clone the Repository**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/PortySec/DockerDream.git
   cd ./Nexus-Registry
   ```

2. **Create the HAProxy Configuration File**

   Create a file named `haproxy.cfg` in the root directory and add the following content:

   ```cfg
   # Global settings
   global
       log stdout format raw local0
       maxconn 4096

   # Default settings
   defaults
       log global
       mode http
       option httplog
       option dontlognull
       timeout connect 5000ms
       timeout client  50000ms
       timeout server  50000ms

   # Frontend configuration for Nexus Web UI
   frontend nexus_frontend
       bind *:8081 ssl crt /run/secrets/haproxy_pem
       default_backend nexus_backend

   # Backend configuration for Nexus
   backend nexus_backend
       server nexus nexus:8081 check

   # Frontend configuration for Docker Registry
   frontend registry_frontend
       bind *:5000 ssl crt /run/secrets/haproxy_pem
       default_backend registry_backend

   # Backend configuration for Docker Registry
   backend registry_backend
       server registry nexus:5000 check
   ```

3. **Create a Self-Signed `.pem` File**

   Use the following command to generate a self-signed certificate:

   ```bash
   openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
   -keyout haproxy.key -out haproxy.crt \
   -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=yourdomain.com"
   cat haproxy.crt haproxy.key > haproxy.pem
   ```

4. **Add the `.pem` File as a Docker Secret**

   Create a Docker secret using the `.pem` file:

   ```bash
   docker secret create haproxy_pem haproxy.pem
   ```

5. **Update Node Labels in `docker-compose.yml`**

   Edit the `docker-compose.yml` file to replace the node labels with your desired labels:

   ```yaml
   - node.labels.zone == zone1 # Replace with your desired zone label
   - node.labels.server == server1 # Replace with your desired server label
   ```

6. **Deploy the Stack**

   Deploy the stack using the following command:

   ```bash
   docker stack deploy -c docker-compose.yml nexus_haproxy
   ```

7. **Access the Services**

   - **Nexus Web UI**: `https://<your-swarm-node-ip>:8081`
   - **Docker Registry**: `https://<your-swarm-node-ip>:5000`

## Additional Information

- **Nexus Data Storage**: Data is stored in the `nexus-data` volume.
- **HAProxy Configuration**: Adjust the HAProxy configuration in `haproxy.cfg` as needed.
- **Scaling Services**: To scale services, adjust the `replicas` parameter in the Docker Compose file.

## License
