# Usa una imagen de PHP con Apache
FROM php:8.1-apache

# Instala extensiones necesarias para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilita los módulos necesarios
RUN a2enmod rewrite

# Expone el puerto 80 para el servicio HTTP
EXPOSE 80

