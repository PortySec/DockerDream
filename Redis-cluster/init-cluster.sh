#!/bin/bash

# Function to check if Redis is ready
check_redis_ready() {
    redis-cli -a chagneme -h $1 ping
}

# Wait for Redis nodes to be ready
for host in redis-1 redis-2 redis-3 redis-4 redis-5 redis-6; do
    echo "Waiting for Redis at $host to be ready..."
    until check_redis_ready $host; do
        sleep 1
    done
done

# Initialize the Redis cluster
echo "Initializing the Redis Cluster..."
echo "yes" | redis-cli --cluster create \
  redis-1:6379 redis-2:6379 redis-3:6379 \
  redis-4:6379 redis-5:6379 redis-6:6379 \
  --cluster-replicas 1