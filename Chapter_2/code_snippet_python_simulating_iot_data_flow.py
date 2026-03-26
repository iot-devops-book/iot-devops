import random, time



def sensor_reading():

    return {

        "temperature": round(random.uniform(18, 35), 2),

        "humidity": round(random.uniform(40, 70), 2)

    }



def send_to_gateway(data):

    print(f"Sending to gateway: {data}")



while True:

    reading = sensor_reading()

    send_to_gateway(reading)

    if reading["temperature"] > 32:

        print("⚠️ High temperature detected, triggering alert...")

    time.sleep(3)