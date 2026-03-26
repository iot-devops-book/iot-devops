#!/bin/bash

# Create a new IoT thing (device)

THING_NAME="SmartSensor01"

aws iot create-thing --thing-name $THING_NAME



# Create and download security certificates for the device

aws iot create-keys-and-certificate --set-as-active \

    --certificate-pem-outfile "certificate.pem.crt" \

    --public-key-outfile "public.key" \

    --private-key-outfile "private.key" > cert.json



# Create a policy that allows publishing/subscribing to IoT topics

aws iot create-policy --policy-name "SensorPolicy" \

    --policy-document '{

        "Version": "2012-10-17",

        "Statement": [{

            "Effect": "Allow",

            "Action": ["iot:Connect", "iot:Publish", "iot:Subscribe", "iot:Receive"],

            "Resource": ["*"]

        }]

    }'



# Attach the policy and certificate to the device

CERT_ARN=$(jq -r '.certificateArn' cert.json)

aws iot attach-thing-principal --thing-name $THING_NAME --principal $CERT_ARN

aws iot attach-policy --policy-name "SensorPolicy" --target $CERT_ARN



echo "IoT device setup complete: $THING_NAME connected to AWS IoT Core"



Explanation:


This Bash script automates the process of preparing an IoT device for AWS. Instead of manually creating certificates and attaching permissions in the AWS console, this script does it in seconds. It ensures secure, automated, and scalable onboarding — which is critical when you have hundreds or thousands of devices to manage.













3.5 AWS IoT Core and Data Flow Management


In modern IoT systems, millions of small devices — sensors, actuators, and controllers — constantly send and receive data. Managing this massive data flow efficiently requires a powerful, scalable, and secure cloud infrastructure. AWS IoT Core acts as the central nervous system of this ecosystem, enabling seamless device connectivity, data processing, and event routing. It ensures that IoT devices can communicate with each other and with backend applications reliably, even across global networks.

In this part, we’ll explore how AWS IoT Core connects devices, handles data ingestion, manages device shadows, and integrates with other AWS services for analytics and automation. We’ll also see how data securely moves from sensors to storage — the journey from “device to dashboard.”


3.6 Device Connectivity in AWS IoT


Figure 3.4: Device Connectivity in AWS IoT


1. Secure Protocols

AWS IoT Core supports multiple communication protocols like MQTT, HTTP, and WebSockets, making it adaptable to various devices. MQTT is particularly lightweight and ideal for sensors with limited power or bandwidth. Every connection is encrypted using TLS (Transport Layer Security), ensuring that transmitted data remains safe from interception or manipulation.


2. Authentication and Authorization

Security in AWS IoT Core is handled via X.509 certificates or AWS Cognito identities. Each device must authenticate before sending or receiving data. Once authenticated, AWS Identity and Access Management (IAM) policies determine what that device can access — creating a strict layer of control over permissions.

3. MQTT Topics and Subscriptions

IoT Core uses a publish-subscribe model, where devices publish data to specific topics and other devices or applications subscribe to them. This method allows real-time updates across thousands of connected nodes without requiring each one to know the other’s identity — increasing efficiency and scalability.

4. Message Broker Role

The IoT Message Broker handles billions of messages per second across devices globally. It ensures messages are delivered in the correct sequence and stored temporarily if the device connection drops. This guarantees reliable data delivery even in unstable network conditions, such as rural IoT installations.

3.7 Managing IoT Device State


Figure 3.5: Managing IoT Device State


1. Device Shadow Concept

A Device Shadow is a virtual copy of a device’s state stored in the cloud. It holds both the last reported and desired state. Even if a device goes offline, applications can continue interacting with its shadow — enabling synchronization once the device reconnects.

2. Synchronization Logic