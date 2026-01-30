FROM n8nio/n8n:latest

USER root

# Install ffmpeg on Alpine
RUN apk update \
 && apk add --no-cache ffmpeg

# Vérification
RUN ffmpeg -version

USER node
