# GitLab Docker Compose Setup Guide

## Overview

This guide provides instructions for setting up a GitLab EE instance using Docker Compose. It's designed to streamline the deployment process, making it easy and efficient to get GitLab up and running in a Docker environment.

## Prerequisites

- **Docker**: Ensure Docker is installed on your host machine.
- **Docker Compose**: Make sure Docker Compose is also installed on your host.

## Docker Compose Configuration

The `docker-compose.yml` file contains the configuration needed to set up your GitLab instance.

### Contents of Docker Compose File

The file includes:

- **GitLab Image**: Specifies the official GitLab Docker image.
- **Restart Policy**: Configures the container to restart automatically unless stopped.
- **Container Name**: Sets a name for the container for easier reference.
- **Hostname**: Defines the hostname for the GitLab instance.
- **Environment Variables**: Sets up necessary environment variables for GitLab.
- **Port Mapping**: Maps ports from the container to the host machine.
- **Volumes**: Configures volumes for persistent data storage.
- **Shared Memory Size**: Specifies the shared memory size for the container.

### Ports and How to Customize Them

- **Default HTTP Port**: GitLab's default HTTP port is `80`. In this setup, it's mapped to `1433` on the host.
- **Default SSH Port**: The default SSH port is `22`. Here, it's mapped to `10022` on the host.
- **Customizing Ports**: To change these, modify the `ports` section in the `docker-compose.yml`. Replace the first number in `'1433:1433'` for HTTP and `'10022:22'` for SSH with your desired host ports.

## Running GitLab

### Starting GitLab

Run the following command in the directory containing your `docker-compose.yml` file:

```bash
docker-compose up -d
```

This command pulls the necessary Docker images and starts your GitLab instance.

### Accessing GitLab

- GitLab will be accessible at the hostname you configured, for example, `http://gitlab.example.com:1433`.
- SSH access to GitLab repositories is available at the same hostname on the configured SSH port (default is `10022`).

### Retrieving the Initial GitLab Password

After starting your GitLab instance for the first time, you can retrieve the initial login password for the GitLab root user with the following command:

```bash
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

This command outputs the auto-generated root password set by GitLab during the initial setup.

**Important Note:** This data is available only for the first 24 hours after setting up the GitLab instance. Ensure that you retrieve this password within this timeframe.

### Stopping GitLab

To stop the GitLab instance, use:

```bash
docker-compose down
```

## Data Persistence

Data persistence is handled through Docker volumes:

- `./config`: Stores GitLab's configuration files.
- `./logs`: Contains log files.
- `./data`: Stores data files including repositories.

## Additional Information

For more detailed configurations and troubleshooting, refer to the [official GitLab documentation](https://docs.gitlab.com/ee/README.html).

