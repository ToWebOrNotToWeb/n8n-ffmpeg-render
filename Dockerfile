# Use specific n8n version for stability
FROM n8nio/n8n:latest

USER root

# Install ffmpeg on Debian-based image
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create custom directory for community nodes
RUN mkdir -p /custom && chown node:node /custom

# Switch back to node user
USER node

# Install community nodes
WORKDIR /custom
RUN npm init -y && \
    npm install
