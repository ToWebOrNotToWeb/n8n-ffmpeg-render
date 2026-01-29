# ---------- Stage 1: Get FFmpeg binary (Debian version) ----------
FROM jrottenberg/ffmpeg:6.0-ubuntu as ffmpeg

# ---------- Stage 2: n8n ----------
FROM n8nio/n8n:latest

USER root

# Installer les dépendances nécessaires pour FFmpeg si besoin (libc, libav*)
RUN apt-get update && apt-get install -y \
    libavcodec58 \
    libavformat58 \
    libavfilter7 \
    libswscale5 \
    libavutil56 \
    && rm -rf /var/lib/apt/lists/*

# Copier le binaire FFmpeg depuis l'étape précédente
COPY --from=ffmpeg /usr/bin/ffmpeg /usr/bin/ffmpeg

# S'assurer que c'est exécutable
RUN chmod +x /usr/bin/ffmpeg

# Vérifier la version
RUN ffmpeg -version

USER node
