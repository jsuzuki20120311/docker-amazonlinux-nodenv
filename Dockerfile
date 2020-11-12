FROM amazonlinux:latest
LABEL maintainer jsuzuki20120311 <shukatu.2012.5.25@gmail.com>

ARG NODE_VERSION=12.18.3
ENV NODE_VERSION ${NODE_VERSION}

RUN yum install gcc gcc-c++ make git openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel libffi-devel tar zip -y && \
    git clone git://github.com/nodenv/nodenv.git /root/.nodenv && \
    git clone git://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build && \
    echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> /root/.bash_profile && \
    echo 'eval "$(nodenv init -)"' >> /root/.bash_profile && \
    source /root/.bash_profile && \
    /root/.nodenv/bin/nodenv install ${NODE_VERSION} && \
    /root/.nodenv/bin/nodenv global ${NODE_VERSION}

ENV PATH /root/.nodenv/shims:/root/.nodenv/bin:$PATH

CMD [ "/bin/bash" ]
