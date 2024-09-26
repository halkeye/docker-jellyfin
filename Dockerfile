FROM ghcr.io/jellyfin/jellyfin:10.9.11

RUN apt-get update && apt-get install -y --no-install-recommends \
  id3v2=0.1.12+dfsg-7 \
  && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/2024.08.06/download/yt-dlp -o /bin/yt-dlp && chmod a+rx /bin/yt-dlp
