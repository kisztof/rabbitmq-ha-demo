# RabbitMQ High Availability Cluster with Docker

This repository contains an example of setting up a high availability (HA) RabbitMQ cluster using Docker and Docker Compose. The cluster consists of 3 RabbitMQ nodes, and mirrored queues are configured using policies.

## Prerequisites

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1. Clone this repository and navigate to the project directory:

```
git clone git@github.com:kisztof/rabbitmq-ha-demo.git
cd rabbitmq-ha-demo
```

2. Start the RabbitMQ cluster using Docker Compose:

```
docker-compose up -d
```
![docker-compose up -d](docs/ss1.png "docker-compose up -d")

3. Wait a few seconds for the cluster to start, then join the nodes together by running the following commands:

```
./join_cluster.sh
```
![./join_cluster.sh](docs/ss2.png "./join_cluster.sh")

4. Set up a policy to enable mirrored queues:

```
docker exec rabbitmq-ha-demo-rabbitmq1-1 rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all","ha-sync-mode":"automatic"}'
```

5. Access the management console at http://127.0.0.1:15672 (default credentials are guest/guest) and check the cluster status. You should see all three nodes in the cluster.

![RabbitMQ cluster](docs/ss3.png "RabbitMQ cluster")

You now have a RabbitMQ cluster with high availability set up using Docker and Docker Compose. All queues created in this cluster will be mirrored across all nodes, providing fault tolerance and redundancy.

Additional Resources:
- [RabbitMQ Official Website](https://www.rabbitmq.com/)
- [RabbitMQ Documentation](https://www.rabbitmq.com/documentation.html)
- [RabbitMQ Tutorials](https://www.rabbitmq.com/getstarted.html)
- [Docker Official Website](https://www.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)