FROM debian:bullseye

RUN apt-get update -qq \
	&& apt-get install --no-install-recommends -y ca-certificates wget build-essential file python \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/webosbrew/meta-lg-webos-ndk/releases/download/1.0.g-rev.5/webos-sdk-x86_64-armv7a-neon-toolchain-1.0.g.sh -P /tmp/ \
	&& chmod 755 /tmp/webos-sdk-x86_64-armv7a-neon-toolchain-1.0.g.sh \
	&& /tmp/webos-sdk-x86_64-armv7a-neon-toolchain-1.0.g.sh -y \
	&& rm /tmp/webos-sdk-x86_64-armv7a-neon-toolchain-1.0.g.sh

RUN apt-get update -qq \
	&& apt-get install --no-install-recommends -y npm \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g @webosose/ares-cli

RUN apt-get update -qq \
	&& apt-get install --no-install-recommends -y cmake pkg-config git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
