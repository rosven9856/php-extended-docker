FROM rosven9856/basic-php-fpm-alpine:latest

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache icu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN apk add --no-cache libpng-dev \
    && apk add --no-cache libwebp-dev \
    && apk add --no-cache libjpeg-turbo-dev \
    && apk add --no-cache freetype-dev \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd
