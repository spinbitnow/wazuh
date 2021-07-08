FROM registry.access.redhat.com/ubi8/ubi:8.3 AS builder

COPY entrypoint.sh ossec.conf authd.pass /

RUN curl https://packages.wazuh.com/4.x/yum/wazuh-agent-4.1.5-1.x86_64.rpm --output /tmp/wazuh-agent.rpm && \ 
yum -y install /tmp/wazuh-agent.rpm && \
  mv /ossec.conf /var/ossec/etc/ && \
  mv /authd.pass /var/ossec/etc/ 

FROM registry.access.redhat.com/ubi8/ubi-minimal:8.3
COPY --from=builder /entrypoint.sh /
COPY --from=builder /var/ossec /var/ossec
COPY --from=builder /etc/ossec-init.conf /etc/ossec-init.conf
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

RUN microdnf -y install procps-ng

ENTRYPOINT ["/entrypoint.sh"]
