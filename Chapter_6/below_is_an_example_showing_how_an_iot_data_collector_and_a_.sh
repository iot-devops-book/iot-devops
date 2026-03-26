# docker-compose.yml

version: '3.8'

services:

  iot-sensor:

    image: python:3.9-slim

    container_name: sensor_app

    volumes:

      - ./sensor:/app

    working_dir: /app

    command: python sensor_data.py

    networks:

      - iot-network



  iot-db:

    image: influxdb:2.0

    container_name: sensor_db

    environment:

      - DOCKER_INFLUXDB_INIT_MODE=setup

      - DOCKER_INFLUXDB_INIT_USERNAME=admin

      - DOCKER_INFLUXDB_INIT_PASSWORD=12345

      - DOCKER_INFLUXDB_INIT_ORG=iot

      - DOCKER_INFLUXDB_INIT_BUCKET=sensor_data

    ports:

      - "8086:8086"

    networks:

      - iot-network



networks:

  iot-network:

    driver: bridge



This setup defines two containers — one running a Python-based IoT sensor app and another hosting an InfluxDB database. Both share a virtual network for secure communication, and data is automatically sent from the sensor to the database.

With just one command — docker-compose up -d — the entire IoT environment is ready. This demonstrates how Docker Compose simplifies multi-container IoT deployments dramatically.











6.8 Networking and Data Handling



Figure 6.6: Networking and Data Handling


1. Container Communication