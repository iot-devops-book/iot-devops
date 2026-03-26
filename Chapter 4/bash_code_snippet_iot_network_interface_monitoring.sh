#!/bin/bash

# IoT Network Interface Monitor Script



LOGFILE="/var/log/iot_network_usage.log"

DATE=$(date)



echo "===== IoT Network Usage Report: $DATE =====" >> $LOGFILE



for IFACE in $(ls /sys/class/net/ | grep -v lo); do

    RX=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)

    TX=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

    echo "Interface: $IFACE | Received: $RX bytes | Transmitted: $TX bytes" >> $LOGFILE

done



echo "===== End of Report =====" >> $LOGFILE



Logic:

This script automatically lists all active interfaces except lo (loopback), reads their RX/TX byte counts, and writes them to a log. Such monitoring is crucial in IoT gateways to balance data loads across different networks (e.g., when Wi-Fi drops, LoRaWAN takes over).







4.8 Wired Connectivity


Figure 4.5: Wired Connectivity

1. Ethernet

Ethernet is the backbone of industrial IoT. It provides fast, stable, and secure communication for PLCs, sensors, and controllers in manufacturing and energy plants.

2. Power Line Communication (PLC)

PLC transmits data over existing electrical wiring — ideal where installing new cables isn’t feasible. It’s often used in smart grids and building automation.

3. Modbus

Modbus is a serial communication protocol used to connect industrial devices. Though old, it remains popular for data acquisition and control systems.

4. CAN Bus

Common in automotive and robotics, CAN Bus enables real-time communication among embedded devices, ensuring smooth and synchronized operations.











4.9 IoT Security — Threats, Encryption, and Network Defense Strategies

Security is the lifeline of every IoT ecosystem. The more devices we connect, the more entry points we create for potential attacks. In a world where millions of sensors, cameras, and controllers are continuously exchanging data, even a small vulnerability can compromise an entire network. Unlike traditional IT systems, IoT devices often lack strong hardware resources for encryption or firewalls, making them easy targets.

The challenge with IoT security lies in its diversity and scale. Devices come from different manufacturers, use different protocols, and often operate in remote or unmonitored environments. This makes it difficult to apply consistent security controls. A smart bulb, an industrial robot, and a connected car may all exist in the same network — yet each has different firmware, update cycles, and protection mechanisms.

Moreover, IoT data is often highly sensitive. From healthcare monitoring to smart cities, breaches can reveal personal, operational, or national-level information. Therefore, IoT security must be built on strong foundations — encryption, authentication, continuous monitoring, and proactive defense mechanisms. Let’s explore how these layers come together to secure modern IoT systems.



4.10 Common Threats in IoT Systems



Figure 4.6: Common Threats in IoT Systems



1. Weak Authentication

Many IoT devices ship with default usernames and passwords that users never change. Attackers exploit this by scanning networks for vulnerable devices. Weak authentication allows unauthorized users to control or manipulate devices remotely, often leading to large-scale botnets.



2. Firmware Vulnerabilities

Firmware acts as the brain of IoT devices. If it’s outdated or poorly written, attackers can inject malicious code through firmware updates or network packets. A single compromised device can spread malware across the entire system.

3. Data Interception

IoT devices often send unencrypted data, which can be intercepted mid-transmission. Attackers perform man-in-the-middle (MITM) attacks, capturing sensitive data like access tokens, health metrics, or industrial readings.


4. Physical Tampering

Because many IoT devices are deployed in public or outdoor areas, they’re vulnerable to physical attacks. Hackers may open the casing, connect to debug ports, or replace components to manipulate readings or bypass authentication.



4.11 Encryption and Secure Communication


Figure 4.7: Encryption and Secure Communication

1. End-to-End Encryption

End-to-end encryption ensures that data is protected from the device to the cloud. Even if intercepted, encrypted data remains unreadable. Common methods include TLS (Transport Layer Security) and DTLS (Datagram TLS) for secure transport.

2. Data Integrity Checks

Integrity ensures that data hasn’t been modified during transmission. Hashing algorithms like SHA-256 or HMAC are used to verify that received data matches what was sent. This is critical for maintaining trust in sensor readings.

3. Secure Key Management

Encryption keys must be generated, stored, and rotated securely. Compromised keys can expose all communications. IoT platforms often use Hardware Security Modules (HSMs) or secure key vaults for this purpose.

4. Lightweight Cryptography

Since many IoT devices have limited processing power, lightweight encryption algorithms like ChaCha20, AES-CCM, and Elliptic Curve Cryptography (ECC) are used to balance performance and protection.