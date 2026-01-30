# ---------- Stage 1: FFmpeg static (force amd64) ----------
FROM --platform=linux/amd64 jrottenberg/ffmpeg:8-scratch AS ffmpeg

# ---------- Stage 2: n8n ----------
FROM n8nio/n8n:latest

USER root

# Copy static FFmpeg binary (correct path for scratch)
COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg

# Make available globally
RUN chmod +x /usr/local/bin/ffmpeg \
 && ln -s /usr/local/bin/ffmpeg /usr/bin/ffmpeg

# Verify
RUN ffmpeg -version

USER node

