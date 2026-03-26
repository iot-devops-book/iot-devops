# Step 1: Update existing packages

sudo apt update -y

sudo apt upgrade -y



# Step 2: Install required dependencies

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y



# Step 3: Add Docker’s official GPG key and repository

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \

  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \

  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \

  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null



# Step 4: Install Docker

sudo apt update -y

sudo apt install docker-ce docker-ce-cli containerd.io -y



# Step 5: Start Docker service

sudo systemctl enable docker

sudo systemctl start docker



# Step 6: Verify installation

docker --version

sudo docker run hello-world


This process sets up Docker on an Ubuntu system. After successful installation, you can deploy small IoT applications as containers, test communication between devices, and ensure identical performance across different systems.


6.4 Setting Up Docker for IoT Development



Figure 6.3: Setting Up Docker for IoT Development


1. Requirements and Compatibility

Docker works on Windows, Linux, and macOS, but IoT projects often use lightweight Linux distributions like Ubuntu or Debian. Devices such as Raspberry Pi or NVIDIA Jetson also support Docker, but they require ARM-compatible versions.



2. Installing Docker on Ubuntu

To install Docker, update your system packages and add Docker’s official repository. Installation typically takes a few minutes, and once complete, Docker can be verified using a sample container. This is the first step before creating IoT-specific applications.



3. Configuring the Docker Service

After installation, the Docker Daemon (the background service) should be configured to start on boot and listen for commands. You can also adjust settings to limit CPU or memory use — useful when running containers on low-power IoT devices.



4. Testing the Setup

Testing ensures everything is running smoothly. The command sudo docker run hello-world downloads a test image and runs a small container that confirms your Docker installation works correctly. This is a quick sanity check before creating real workloads.



6.5 Building and Managing IoT Containers

In IoT systems, every device, gateway, and cloud service plays a specific role — from capturing data to processing it and forwarding it to the cloud. Managing this complex chain can be a nightmare without proper structure. Docker simplifies this process by packaging these components into independent containers. Each container can handle one microservice: one for sensor data collection, one for analytics, and another for database storage.

When these containers are combined, they form a modular, manageable, and highly scalable IoT environment. The true beauty of Docker lies in its consistency. Whether you’re testing code locally on your laptop, deploying it on an edge device, or scaling it to cloud servers, the behavior remains identical.