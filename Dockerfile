ARG UPSTREAM_VERSION=10.9.11
FROM ghcr.io/jellyfin/jellyfin:${UPSTREAM_VERSION}
ARG TARGETPLATFORM
ARG YTDLP_VERSION=2024.08.06

RUN apt-get update && apt-get install -y --no-install-recommends \
  id3v2=0.1.12+dfsg-7 \
  && rm -rf /var/lib/apt/lists/*

RUN DOCKER_ARCH=$(case ${TARGETPLATFORM:-linux/amd64} in \
  "linux/amd64")   echo "_linux"  ;; \
  "linux/arm/v7")  echo "_linux_armv7l"   ;; \
  "linux/arm64")   echo "_linux_aarch64" ;; \
  *)               echo ""        ;; esac) \
  && echo "DOCKER_ARCH=$DOCKER_ARCH" \
  && set -x && curl --fail -L https://github.com/yt-dlp/yt-dlp/releases/download/${YTDLP_VERSION}/yt-dlp${DOCKER_ARCH} -o /bin/yt-dlp && chmod a+rx /bin/yt-dlp
