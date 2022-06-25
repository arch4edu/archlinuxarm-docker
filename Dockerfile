FROM --platform=linux/amd64 alpine:3.16 AS verify
RUN apk add --no-cache libarchive-tools

COPY ArchLinuxARM-aarch64-latest.tar.gz /tmp
RUN mkdir /rootfs && bsdtar -xpf /tmp/ArchLinuxARM-aarch64-latest.tar.gz -C /rootfs

FROM scratch as root
COPY --from=verify /rootfs/ /

ENV LANG=C.UTF-8
CMD ["/usr/bin/bash"]
