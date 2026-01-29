# ---------- Stage 1: Get FFmpeg binary ----------
FROM jrottenberg/ffmpeg:6.0-ubuntu as ffmpeg

# ---------- Stage 2: n8n ----------
FROM n8nio/n8n:latest

USER root

# Copier le binaire FFmpeg et ses dépendances dans n8n
COPY --from=ffmpeg /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu

# S'assurer que le binaire est exécutable
RUN chmod +x /usr/local/bin/ffmpeg \
    && ln -s /usr/local/bin/ffmpeg /usr/bin/ffmpeg

# Vérifier que ffmpeg fonctionne correctement
RUN ffmpeg -version

USER node
