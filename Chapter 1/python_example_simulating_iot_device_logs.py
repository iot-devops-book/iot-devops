import time

import random

from datetime import datetime



def generate_sensor_data():

    temperature = random.uniform(18.0, 30.0)

    humidity = random.uniform(40.0, 70.0)

    return {"temp": round(temperature, 2), "humidity": round(humidity, 2)}



def log_to_file(data):

    with open("device_logs.txt", "a") as file:

        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        file.write(f"{timestamp} | Temp: {data['temp']}°C | Humidity: {data['humidity']}%\n")



if __name__ == "__main__":

    print("Starting IoT device data simulation...")

    for _ in range(10):

        sensor_data = generate_sensor_data()

        log_to_file(sensor_data)

        print("Data logged:", sensor_data)

        time.sleep(2)

Explanation: This Python program simulates a small IoT device that generates random sensor data and logs it every 2 seconds — a realistic start for monitoring pipelines. In an IoT DevOps workflow, such logs would be shipped automatically to cloud storage or analyzed in real time.