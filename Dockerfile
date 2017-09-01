# Date:  9/1/2017
FROM debian:stretch
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    ghostscript \
    libfontconfig-dev \
    libx11-dev \
    libxmu-dev \
    libxaw7-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install
COPY texlive.profile /texlive.profile
ADD http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz /install-tl.tar.gz
RUN tar xf install-tl.tar.gz \
    && rm -f install-tl.tar.gz \
    && mv `ls -d install-tl-*` install-tl \
    && install-tl/install-tl -profile texlive.profile \
    && rm -rf install-tl

# Setup docker app
ENV BE_UID=1000 BE_GID=1000 PATH="/usr/local/texlive/2017/bin/x86_64-linux:${PATH}"
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /app
WORKDIR /app
ENTRYPOINT ["/docker-entrypoint.sh"]
