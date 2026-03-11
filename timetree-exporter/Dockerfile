FROM python:3.14-alpine
ENV PYTHONUNBUFFERED=1 TIMETREE_EMAIL="" TIMETREE_PASSWORD="" TIMETREE_CALENDER_CODE=""

# Install supercronic - a cron replacement designed for containers
ARG SUPERCRONIC_VERSION=0.2.43
ARG TARGETARCH
# Download the supercronic binary for the target architecture and make it executable
RUN wget -q "https://github.com/aptible/supercronic/releases/download/v${SUPERCRONIC_VERSION}/supercronic-linux-${TARGETARCH}" \
    -O /usr/local/bin/supercronic && \
    chmod +x /usr/local/bin/supercronic
COPY crontab /etc/crontab

RUN pip install --no-cache-dir timetree-exporter

COPY execute-exporter.sh /usr/local/bin/execute-exporter.sh
RUN chmod +x /usr/local/bin/execute-exporter.sh


ENTRYPOINT ["supercronic", "/etc/crontab"]
