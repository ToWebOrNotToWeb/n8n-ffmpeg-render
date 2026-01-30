FROM n8nio/n8n:latest

USER root

# Télécharger le binaire FFmpeg statique (John Van Sickle)
RUN curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
    | tar -xJ -C /tmp \
 && mv /tmp/ffmpeg-*-static/ffmpeg /usr/local/bin/ffmpeg \
 && chmod +x /usr/local/bin/ffmpeg

# Vérification
RUN ffmpeg -version

USER node
