import time

import re



LOG_FILE = "/var/log/iot_network.log"

THRESHOLD = 5

failed_attempts = {}



def monitor_log():

    print("Starting IoT Security Monitor...")

    while True:

        with open(LOG_FILE, "r") as f:

            lines = f.readlines()

        for line in lines[-100:]:  # Check latest 100 lines

            match = re.search(r"Failed connection from (\d+\.\d+\.\d+\.\d+)", line)

            if match:

                ip = match.group(1)

                failed_attempts[ip] = failed_attempts.get(ip, 0) + 1

                if failed_attempts[ip] > THRESHOLD:

                    print(f"[ALERT] Suspicious activity from {ip} — {failed_attempts[ip]} failed attempts.")

        time.sleep(10)



if __name__ == "__main__":

    monitor_log()



Logic:

This script continuously scans network logs for failed connection attempts. When a particular IP exceeds a threshold, it flags it as suspicious. Such real-time detection helps administrators respond before attackers gain control of IoT devices.



4.12 Network Defense and Monitoring Strategies



Figure 4.8: Network Defense and Monitoring Strategies

1. Intrusion Detection Systems (IDS)

IoT networks require continuous monitoring to detect abnormal behavior. IDS tools analyze traffic patterns to identify unauthorized access, data spikes, or anomalies. They serve as an early warning system before major breaches occur.

2. Network Segmentation