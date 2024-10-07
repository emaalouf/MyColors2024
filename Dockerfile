# Use the official PHP image as the base
FROM php:8.0-fpm

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the project files
COPY . .

# Install PHP dependencies
RUN composer install --optimize-autoloader --no-dev

# Expose port 8000 and run the application using PHP's built-in server
EXPOSE 8000
CMD php -S 0.0.0.0:8000 -t public
