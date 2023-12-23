FROM docker.io/theoparis/ct-ng:latest

RUN mkdir armv5tejl

COPY ./config/armv5tejl.cfg armv5tejl/.config

RUN cd armv5tejl && \
	ct-ng oldconfig && \
	ct-ng build && \
	cd .. && \
	rm -r crosstool-ng-${XTOOLNG_VERSION}

ENV PATH="${PATH}:$WORKDIR/x-tools/armv5tejl-unknown-linux-gnueabi/bin"

CMD ["bash"]
