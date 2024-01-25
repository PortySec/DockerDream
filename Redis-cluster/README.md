# Redis Cluster Deployment with Docker Swarm

This repository provides configuration files for deploying a Redis cluster using Docker Swarm. It includes a Docker Compose file to define a stack with six Redis nodes and an initialization script for setting up the cluster. This setup is suitable for scalable, distributed environments.

## Prerequisites

Ensure you have the following installed before proceeding:
- Docker Engine
- Docker Swarm initialized on your machine or cluster

## Project Structure

The repository includes:
- `docker-compose.yml`: Docker Compose configuration for Docker Swarm deployment.
- `init-cluster.sh`: Shell script to initialize the Redis cluster.
- `redis.conf`: Configuration file for individual Redis nodes.

## Configuration

### Docker Compose for Swarm

The `docker-compose.yml` file is tailored for Docker Swarm deployment. It defines services for six Redis nodes and an additional service for initializing the cluster. Each node uses the latest Redis image and mounts a custom `redis.conf`.

### Redis Configuration (`redis.conf`)

This file sets essential configurations for each Redis node:
- Port: 6379
- Cluster mode enabled
- Node timeout settings
- Password protection (`changeme`)

### Cluster Initialization (`init-cluster.sh`)

The script waits for all Redis nodes to be ready before initializing the cluster with a replica for each master node.

## Deployment

### Deploying the Stack

To deploy this stack to your Docker Swarm, navigate to the directory containing `docker-compose.yml` and run:

```bash
docker stack deploy -c docker-compose.yml redis_cluster
```

This command will create a stack named `redis_cluster`.

### Managing the Stack

To view the status of your stack:

```bash
docker stack ps redis_cluster
```

To remove the stack:

```bash
docker stack rm redis_cluster
```

## Access and Security

Interact with the Redis cluster using any Redis client. The default password is `changeme`, as specified in `redis.conf`. It is highly recommended to change this password in a production environment.

## Customization

You may customize the stack by modifying `redis.conf` and `docker-compose.yml`. Ensure that changes in configurations are consistent across these files.

## Contributing

We welcome contributions! Please fork the repository and submit a pull request with your enhancements.



