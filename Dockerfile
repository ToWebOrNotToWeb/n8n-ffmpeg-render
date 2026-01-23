# Use official n8n image
FROM n8nio/n8n:latest

# Switch to root user
USER root

# Install ffmpeg on Debian base image
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to node user
USER node
