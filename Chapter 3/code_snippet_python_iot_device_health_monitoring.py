import psutil

import time



def monitor_device():

    while True:

        cpu = psutil.cpu_percent(interval=1)

        memory = psutil.virtual_memory().percent

        temp = psutil.sensors_temperatures().get('coretemp', [{'current': 0}])[0]['current']



        print(f"CPU: {cpu}% | Memory: {memory}% | Temp: {temp}°C")



        if cpu > 85 or memory > 90 or temp > 75:

            print("⚠️ Warning: High resource usage detected!")



        time.sleep(5)



monitor_device()



This simple Python script mimics an IoT health monitor that keeps track of CPU, memory, and temperature. If resource usage exceeds safe limits, it triggers alerts — simulating automated maintenance and performance checks within a real IoT device.




Cloud Infrastructure for IoT (AWS)

3.1 Building IoT Cloud Foundations on AWS


When we talk about the “cloud” in IoT, we’re referring to a virtual space where all your devices send and receive data — safely, automatically, and globally. Imagine you have 1,000 temperature sensors across a factory or a city. Each device sends small packets of data — temperature, humidity, battery status — every few seconds. Managing such huge streams of data manually or on local servers isn’t practical. That’s where AWS (Amazon Web Services) comes in.

AWS provides a powerful platform that connects your IoT devices, stores their data, and processes it intelligently — all without needing to buy or maintain your own physical servers. With AWS, you can connect thousands (or even millions) of devices, send data securely, and automatically trigger actions like alerts, analytics, or machine learning predictions.