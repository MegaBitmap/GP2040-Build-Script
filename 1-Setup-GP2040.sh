#! /bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y install git curl cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib build-essential python3-venv

# Install pico sdk
cd "$HOME"
git clone https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git checkout tags/2.1.1-correct-picotool
git submodule update --init
cd ..

# Install node
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 20
# Verify the Node.js version:
node -v # Should print "v20.19.6".
# Verify npm version:
npm -v # Should print "10.8.2".

# Download GP2040 source code
git clone https://github.com/OpenStickCommunity/GP2040-CE.git
cd GP2040-CE
git submodule update --init
