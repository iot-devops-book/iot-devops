import time

import random



def build_firmware():

    print("Building IoT firmware...")

    time.sleep(2)

    print("Build complete.")



def run_tests():

    print("Running automated tests...")

    time.sleep(2)

    result = random.choice(["PASS", "FAIL"])

    print(f"Test result: {result}")

    return result == "PASS"



def deploy_firmware():

    print("Deploying firmware to IoT devices...")

    time.sleep(2)

    print("Deployment successful.")



# Simulate CI/CD workflow

print("Starting IoT DevOps pipeline...\n")

build_firmware()



if run_tests():

    deploy_firmware()

else:

    print("Tests failed. Deployment aborted.")