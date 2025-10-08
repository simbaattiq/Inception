FROM debian:bullseye
    
# Install PHP-FPM and WordPress dependencies
RUN apt-get update && apt-get install -y \
    wget \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-soap \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Download WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    cp -R wordpress/* . && \
    rm -rf wordpress latest.tar.gz

# Set permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy PHP-FPM configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
