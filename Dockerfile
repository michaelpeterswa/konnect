FROM --platform=$BUILDPLATFORM rockylinux:9 as stage1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY scripts/ /scripts/
RUN  /scripts/configure.sh

FROM stage1 as stage2
RUN /scripts/install_packages.sh

FROM stage2 as stage3
RUN /scripts/modify_shell.sh
