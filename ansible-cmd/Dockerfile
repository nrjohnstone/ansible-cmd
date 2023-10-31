FROM alpine:3.18

RUN apk --update --no-cache add \
        ca-certificates \
        git \
        openssh-client \
        openssl \
        py3-cryptography \
        py3-pip \
        py3-yaml \
        python3\
        rsync \
        sshpass

RUN apk --update --no-cache add --virtual \
        .build-deps \
        build-base \
        cargo \
        curl \
        libffi-dev \
        openssl-dev \
        python3-dev         

RUN pip3 install --no-cache-dir --upgrade pip

# ====== Install Ansible ======
ENV ANSIBLE_VERSION 8.5.0

RUN pip3 install --no-cache-dir --no-binary \
        cffi \
        ansible==${ANSIBLE_VERSION}

RUN ansible-galaxy collection install community.docker:3.4.10

RUN echo "==> Cleaning up..."  && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

RUN echo "==> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True

COPY docker_init.sh /usr/local/bin/docker_init.sh
RUN chmod +x /usr/local/bin/docker_init.sh 

RUN mkdir /root/.ssh
RUN mkdir /private_keys

WORKDIR /ansible/playbooks

CMD ["/usr/local/bin/docker_init.sh"]