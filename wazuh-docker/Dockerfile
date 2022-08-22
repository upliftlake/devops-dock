# Wazuh App Copyright (C) 2021 Wazuh Inc. (License GPLv2)
FROM python:3.9-slim-buster
# Dependencies
RUN apt-get update && \
    apt-get install curl procps apt-transport-https lsb-release -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    mkdir /scripts /config\
    pip3 install docker
# Install the Wazuh agent
RUN curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.1.5-1_amd64.deb && dpkg -i ./wazuh-agent.deb
# Entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
