FROM n8nio/n8n:latest

USER root

# Installer FFmpeg et ses dépendances (Alpine compatible)
RUN apk add --no-cache ffmpeg

RUN ffmpeg -version

USER node