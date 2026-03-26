#!/bin/bash

# IoT Firmware Deployment Script



FIRMWARE_PATH="/builds/firmware/latest.bin"

DEVICE_LIST="devices.txt"

LOG_FILE="deploy.log"



echo "Starting IoT firmware deployment..." | tee -a $LOG_FILE



while read DEVICE; do

    echo "Deploying firmware to $DEVICE..." | tee -a $LOG_FILE

    scp $FIRMWARE_PATH user@$DEVICE:/tmp/firmware.bin

    ssh user@$DEVICE "sudo systemctl stop iot-service && \

                      sudo cp /tmp/firmware.bin /opt/iot/firmware.bin && \

                      sudo systemctl start iot-service"

    if [ $? -eq 0 ]; then

        echo "Deployment successful for $DEVICE" | tee -a $LOG_FILE

    else

        echo "Deployment failed for $DEVICE. Initiating rollback..." | tee -a $LOG_FILE

        ssh user@$DEVICE "sudo cp /opt/iot/backup/firmware_old.bin /opt/iot/firmware.bin && \

                          sudo systemctl restart iot-service"

    fi

done < $DEVICE_LIST



echo "Firmware deployment completed!" | tee -a $LOG_FILE



This script automates firmware delivery across multiple IoT devices. It transfers the latest firmware file to each device, restarts services safely, and rolls back automatically if an error occurs — ensuring reliability in real-world IoT environments.























10.4 Deployment Automation Using Bash



Figure 10.3: Deployment Automation Using Bash



1. Infrastructure Preparation

Before deploying to devices or servers, infrastructure must be ready. Bash scripts are commonly used to automate environment preparation — setting permissions, configuring servers, or initializing device groups.

2. Deployment Execution

Bash scripts can execute deployment tasks, push firmware images, and restart services automatically. This ensures reliable delivery and consistent rollout of updates across all IoT devices.



3. Rollback Mechanisms

In case of failure, automated rollback is critical. Scripts should verify deployment success and revert to previous stable versions if errors are detected. This prevents device downtime or bricking.

4. Logging and Monitoring

Logging each step of deployment provides visibility and debugging capability. Bash scripts can integrate with monitoring tools like Prometheus, pushing logs for analysis and alerting.





















10.5 Programmatic Deployment and Orchestration


Figure 10.4: Programmatic Deployment and Orchestration



1. Controller APIs (ArgoCD / OTA / DeviceMgr)