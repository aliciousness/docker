# Use Ubuntu as the base image
FROM ubuntu:latest

# Environment variables for MySQL setup (can be overridden at runtime)
ENV MYSQL_ROOT_PASSWORD=your_default_root_password
ENV MYSQL_DATABASE=semaphore

# Install wget, sudo, python3, python3-pip, and mysql-server
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget sudo python3 python3-pip mysql-server

# Install jq for JSON processing
RUN apt-get install -y jq

# Download Semaphore
RUN wget https://github.com/ansible-semaphore/semaphore/releases/download/v2.8.75/semaphore_2.8.75_linux_amd64.deb

# Install Semaphore
RUN dpkg -i semaphore_2.8.75_linux_amd64.deb || apt-get install -f -y

# Install ansible-core using pip
RUN pip3 install ansible-core

# Create Semaphore tmp directory
RUN mkdir /tmp/semaphore

# Copy config.json into the container (make sure the file is in the context of the build)
COPY config/.config.json /opt/semaphore/config.json

# Copy the entrypoint script into the container
COPY config/entry-point.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port 3000
EXPOSE 3000

# Set the working directory
WORKDIR /opt/semaphore

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
