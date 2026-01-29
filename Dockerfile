FROM n8nio/n8n:latest-alpine

USER root

# Install ffmpeg
RUN apk add --no-cache ffmpeg

# Create custom directory for community nodes
RUN mkdir -p /custom && chown node:node /custom

USER node

WORKDIR /custom
RUN npm init -y
