FROM debian:bookworm-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y curl php8.2 php-fpm php-mysql mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/wp.sh /usr/local/bin/wp.sh

RUN chmod +x /usr/local/bin/wp.sh

CMD ["/usr/local/bin/wp.sh"]
