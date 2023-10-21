FROM --platform=linux/amd64 php:8.1.19-cli

RUN apt-get update -y && apt-get install -y --no-install-recommends \
	libzip-dev \
    zip unzip bzip2 zlib1g-dev \
    libxml2-dev \
    libpng-dev \
    libbz2-dev \
    curl libcurl4-openssl-dev \
    default-mysql-client

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install xml

RUN pecl install xdebug-3.2.0
RUN docker-php-ext-enable xdebug
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
