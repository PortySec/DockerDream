# RabbitMQ Cluster Deployment with Docker Swarm

This repository contains the configuration for deploying a RabbitMQ cluster using Docker Swarm. It includes a Docker Compose file for setting up a three-node RabbitMQ cluster and a RabbitMQ configuration file for fine-tuning the setup. This deployment is suitable for scalable, distributed messaging environments.

## Prerequisites

Before you start, ensure you have the following installed:
- Docker Engine
- Docker Swarm initialized on your machine or cluster

## Project Structure

The repository includes:
- `docker-compose.yml`: Docker Compose configuration for Docker Swarm deployment.
- `rabbitmq.conf`: RabbitMQ configuration file.

## Configuration

### Docker Compose for Swarm

The `docker-compose.yml` file is designed for Docker Swarm. It defines services for three RabbitMQ nodes, each configured to use the latest RabbitMQ image and a custom `rabbitmq.conf`.

### RabbitMQ Configuration (`rabbitmq.conf`)

This configuration file includes:
- Management interface credentials (`root`/`changeme`).
- Security settings to disable loopback users (`admin`, `guest`).
- Memory and disk space usage limits.
- TLS-only listener configuration.
- Automatic cluster partition handling.
- Consul peer discovery settings for RabbitMQ cluster nodes.

## Deployment

### Deploying the Stack

To deploy this stack to your Docker Swarm, run:

```bash
docker stack deploy -c docker-compose.yml rabbitmq_cluster
```

This command creates a stack named `rabbitmq_cluster`.

### Managing the Stack

To check the status:

```bash
docker stack ps rabbitmq_cluster
```

To remove the stack:

```bash
docker stack rm rabbitmq_cluster
```

## Access and Security

Access the RabbitMQ management interface using the credentials specified in `rabbitmq.conf`. It is highly recommended to change these default credentials in a production environment.

## Customization

Customize the stack by modifying `rabbitmq.conf` and `docker-compose.yml`. Ensure that configuration changes are consistent across these files.

## Contributing

Contributions to enhance the RabbitMQ cluster setup are welcome. Please fork the repository and submit a pull request with your changes.
