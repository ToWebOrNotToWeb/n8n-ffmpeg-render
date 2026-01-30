FROM n8nio/n8n:latest

USER root

# Install ffmpeg (simple, fiable)
RUN apt-get update \
 && apt-get install -y ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Vérification (optionnel mais utile au build)
RUN ffmpeg -version

USER node
