FROM jenkins:2.19.4

ARG DOCKER_ARCHIVE=docker-1.12.3.tgz

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Install docker client only
RUN mkdir -p /opt/docker-cli \
    && cd /opt \
    && wget https://get.docker.com/builds/Linux/x86_64/${DOCKER_ARCHIVE} \
    && tar -xvf ${DOCKER_ARCHIVE} \
    && mv docker/docker docker-cli/ \
    && rm -rf docker && rm -rf ${DOCKER_ARCHIVE} \
    && ln -s /opt/docker-cli/docker /usr/bin/docker
