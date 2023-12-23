# ct-ng dockerfile for building a cross-compiler toolchain

FROM debian:sid

# Install dependencies
RUN apt-get update && apt-get install -y \
	bison \
	build-essential \
	curl \
	flex \
	gawk \
	git \
	gperf \
	unzip \
	libncurses5-dev \
	libtool-bin \
	help2man \
	texinfo \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# Install ct-ng
RUN git clone https://github.com/crosstool-ng/crosstool-ng \
	&& cd crosstool-ng \
	&& ./bootstrap \
	&& ./configure \
	&& make \
	&& make install \
	&& cd .. \
	&& rm -rf crosstool-ng

ENV PATH="/usr/local/bin:${PATH}"
CMD ["/bin/bash"]
