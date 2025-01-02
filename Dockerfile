# Use an official Ubuntu as a parent image
FROM ubuntu:latest
LABEL Name=tirsvadclilinux_distribution Version=0.0.1

# Install necessary packages
RUN apt-get update && apt-get install -y \
    bash \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Set the SHELL to bash
SHELL ["/bin/bash", "-c"]

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Make test script executable
RUN chmod +x /usr/src/app/src/Distribution/distribution.sh
RUN chmod +x /usr/src/app/src/Test/test_distribution.sh

# Set the working directory in the container
WORKDIR /usr/src/app/src/Test

# Run the test script
#CMD ["./test_distribution.sh"]
