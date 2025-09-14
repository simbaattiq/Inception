FROM ubuntu:bookworm-slim

RUN RUN apt-get update && \
    apt-get install -y --no-install-recommends mariadb-server=1:10.11.* && \
    rm -rf /var/lib/apt/lists/*

# Create MySQL data directory and fix permissions
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

EXPOSE  3306

COPY ./conf/my.cnf /etc/mysql/my.cnf

CMD ["mysqld", "--defaults-file=/etc/mysql/my.cnf"]

WORKDIR /data/app/mariaDb

ENV ../../.env

# HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:8080/health || exit 1

RUN adduser --disabled-password appuser
USER appuser

CMD ["bla bla", "bla lba"]