#!/bin/sh

# This Script for Ubuntu 18.04 LTS

# 1. Install docker
sudo apt-get update -y
echo "Done Update"
sudo apt install docker.io -y
echo "Done setup docker"

# 2. Install npm and Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs
echo "Done setup NodeJS"

# 3. Install yarn
npm install -g yarn

# 4. Install Cypress dependencies
sudo apt-get install libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y
echo "Done install Cypress dependencies"

# 5. Install Java
sudo apt install -y default-jdk
echo "Done Install default-jdk"

# 6. Download Jenkins package. 
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# To Solve error on my machine
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 9B7D32F2D50582E6

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
echo "Done Update Package"

sudo apt-get install -y jenkins
echo "Done Install jenkins"

# Start the Jenkins server
sudo systemctl start jenkins

# Enable the service to load during boot
sudo systemctl enable jenkins
sudo systemctl status jenkins
