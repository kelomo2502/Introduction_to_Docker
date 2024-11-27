#!/bin/bash

# Introduction_to_Docker
# Script to install Docker on Ubuntu 20.04 LTS

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

# Update the package list
echo "Updating package list..."
sudo apt-get update -y

# Install required packages
echo "Installing necessary packages: ca-certificates, curl, and gnupg..."
sudo apt-get install -y ca-certificates curl gnupg

# Create a directory for the Docker keyring
echo "Creating keyrings directory for Docker..."
sudo install -m 0755 -d /etc/apt/keyrings

# Download and store the Docker GPG key
echo "Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again to include the Docker repository
echo "Updating package list to include Docker repository..."
sudo apt-get update -y

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version && echo "Docker installed successfully."

# Enable and start Docker service
echo "Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Final status message
echo "Docker installation complete. You can now use Docker."
