Macvlan: Assigns MAC addresses to containers for advanced use cases.



# Create a custom bridge network for containers

docker network create --driver bridge iot_bridge

# Run two containers in the same custom network

docker run -d --name sensor1 --network iot_bridge nginx

docker run -d --name sensor2 --network iot_bridge busybox sleep 3600








6.11 Container Orchestration



Figure 6.8: Container Orchestration

Running one or two containers manually is easy, but in large-scale IoT or cloud systems, automation is essential. Container orchestration platforms like Docker Swarm and Kubernetes simplify the deployment, scaling, and management of containers. These tools handle container scheduling, service discovery, and failure recovery automatically.