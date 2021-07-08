FROM registry.access.redhat.com/ubi8/ubi:8.3


COPY entrypoint.sh ossec.conf authd.pass /

RUN yum -y install https://packages.wazuh.com/4.x/yum/wazuh-agent-4.1.5-1.x86_64.rpm && \
  mv /ossec.conf /var/ossec/etc/ && \
  mv /authd.pass /var/ossec/etc/ 

ENTRYPOINT ["/entrypoint.sh"]


