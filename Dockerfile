# ---------- Stage 1: FFmpeg static ----------
FROM jrottenberg/ffmpeg:8-scratch as ffmpeg

# ---------- Stage 2: n8n ----------
FROM n8nio/n8n:latest

USER root

# Copy static FFmpeg binary (correct path)
COPY --from=ffmpeg /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg

# Make it executable and available globally
RUN chmod +x /usr/local/bin/ffmpeg \
 && ln -s /usr/local/bin/ffmpeg /usr/bin/ffmpeg

# Verify
RUN ffmpeg -version

USER node
