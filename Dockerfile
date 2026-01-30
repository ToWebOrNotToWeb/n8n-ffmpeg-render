dockerfile n8n ffmpeg

# ---------- Stage 1: Get ffmpeg binary ----------
FROM jrottenberg/ffmpeg:6.0-alpine as ffmpeg

# ---------- Stage 2: n8n ----------
FROM n8nio/n8n:latest

USER root

# Copy ffmpeg binary into n8n image
COPY --from=ffmpeg /usr/local/bin/ffmpeg /usr/bin/ffmpeg

# Make sure it's executable
RUN chmod +x /usr/bin/ffmpeg

USER node
