# Clone the Poky reference build system (Yocto)

git clone git://git.yoctoproject.org/poky.git

cd poky



# Checkout a stable release branch (e.g., Kirkstone)

git checkout kirkstone



# Source the environment setup script

source oe-init-build-env



# Set the target machine (for Raspberry Pi 4)

echo 'MACHINE = "raspberrypi4"' >> conf/local.conf



# Add additional layers for IoT applications

bitbake-layers add-layer ../meta-openembedded/meta-networking

bitbake-layers add-layer ../meta-raspberrypi



# Build a minimal core image

bitbake core-image-minimal



Explanation:

This script creates a build environment, configures the target hardware, adds IoT-related layers, and compiles the image using BitBake. The resulting image can then be flashed onto your IoT device using SD card tools or over-the-air deployment systems.







9.4 Building IoT Systems with Yocto



Figure 9.3: Building IoT Systems with Yocto


1. Configuring the Build Host

To start building an image with Yocto, you first set up your host system with dependencies like Git, Python, and build essentials. This environment ensures that Yocto can fetch, compile, and assemble all necessary components without conflicts.

2. Selecting a Machine Configuration

Yocto supports various “machine” configurations — each representing a specific board or hardware platform. You can select a predefined machine like raspberrypi4 or create a custom one for your device. This step defines which kernel and drivers will be included.

3. Adding Custom Layers

Developers can add layers to include custom applications, security policies, or network services. For IoT, these may include MQTT brokers, edge AI libraries, or monitoring tools. Layers make it easy to modularize functionality without breaking the base image.

4. Building the Image

Once configurations are set, you trigger the build using BitBake. It compiles each component according to its recipe and assembles the final image. Depending on your hardware and options, the process may take several hours but results in a consistent, deployable firmware image.





















9.5 Customizing Yocto Images


Figure 9.4: Customizing Yocto Images


1. Modifying local.conf