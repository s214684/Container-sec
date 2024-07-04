# Use an official MySQL image as a parent image
FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_DATABASE=testdb
ENV MYSQL_USER=root
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

# Copy the initialization SQL script to create tables and seed data
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
