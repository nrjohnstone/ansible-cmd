#
# Inspiration from the following image
#   https://github.com/spurin/container-systemd/tree/ubuntu_22.04
#
FROM ubuntu:22.04

# Install systemd
RUN apt-get update \
    && apt-get install -y systemd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Disable multi-user.target.wants, this can interfere with
# the parent console on linux systems when using systemd
# as a container subcomponent
RUN rm -f /lib/systemd/system/multi-user.target.wants/*

# Remove the MOTD unminimize message for Ubuntu systems
RUN rm -rf /etc/update-motd.d/60-unminimize

# Specify a different stop signal for systemd
STOPSIGNAL SIGRTMIN+3

# Mask and unmask services
RUN systemctl mask systemd-firstboot.service systemd-udevd.service systemd-modules-load.service \
&& systemctl unmask systemd-logind

# ====== CUSTOMIZATIONS FOR ANSIBLE ========

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-cryptography
RUN apt-get install -y python3-yaml
RUN apt-get install -y openssh-client
RUN apt-get install -y sshpass

RUN pip install --no-cache-dir --upgrade pip

RUN pip install cffi==1.16.0
RUN pip install pywinrm==0.4.3
RUN pip install requests-credssp==2.0.0

ENV ANSIBLE_VERSION 8.5.0

RUN pip install ansible==${ANSIBLE_VERSION}

RUN ansible-galaxy collection install community.docker:3.4.10

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True

RUN mkdir /root/.ssh
RUN mkdir /private_keys

RUN echo "==> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

RUN echo "==> Cleaning up..."  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /ansible/playbooks

# Execute systemd via the container-entrypoint.sh script
COPY container-entrypoint.sh /bin/container-entrypoint.sh
ENTRYPOINT ["/bin/container-entrypoint.sh"]