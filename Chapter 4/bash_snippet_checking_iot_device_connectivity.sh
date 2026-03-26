#!/bin/bash

# IoT Device Connectivity Check Script



NETWORK="192.168.1"

LOGFILE="/var/log/iot_device_status.log"

DATE=$(date)



echo "===== IoT Connectivity Report: $DATE =====" >> $LOGFILE



for DEVICE in {1..50}; do

    IP="$NETWORK.$DEVICE"

    if ping -c 1 -W 1 $IP >/dev/null 2>&1; then

        echo "Device $IP is ONLINE" >> $LOGFILE

    else

        echo "Device $IP is OFFLINE" >> $LOGFILE

    fi

done



echo "===== End of Report =====" >> $LOGFILE



Logic:

This script scans 50 IoT devices in a local network (192.168.1.x) and logs their online/offline status. In real IoT setups, similar monitoring scripts help track device uptime and detect connectivity issues proactively





4.4 IoT Protocol Stack



Figure 4.3:  IoT Protocol Stack

1. Physical and Data Link Layer

At this layer, the actual transmission happens. IoT uses technologies like IEEE 802.15.4, Bluetooth Low Energy, Wi-Fi, and LoRa. The goal is to balance speed with low power usage.

2. Network Layer

Responsible for routing and addressing. Protocols like 6LoWPAN (IPv6 over Low Power Wireless Personal Area Networks) enable IPv6 communication on resource-constrained devices.

3. Transport Layer