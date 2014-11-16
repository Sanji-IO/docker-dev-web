FROM debian:wheezy
MAINTAINER Zack Yang <zack9433@gmail.com>

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

USER root
ENV HOME /root
ENV NODE_INSTALL_VERSION v0.10.33

RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN /bin/bash -c "source ~/.nvm/nvm.sh && nvm install ${NODE_INSTALL_VERSION} && \
    nvm use ${NODE_INSTALL_VERSION} && nvm alias default ${NODE_INSTALL_VERSION} && \
    ln -s $HOME/.nvm/${NODE_INSTALL_VERSION}/bin/node /usr/bin/node && \
    ln -s $HOME/.nvm/${NODE_INSTALL_VERSION}/bin/npm /usr/bin/npm"

ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]

CMD ["bash"]
