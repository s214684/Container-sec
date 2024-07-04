# build maven project
FROM maven:3.6.3-jdk-8 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn package

# run the application
FROM ubuntu:latest
RUN apt update && apt-get install -y openjdk-8-jdk-headless

WORKDIR /usr/app
COPY --from=build /usr/src/app/target/hello-world-1.0.0.jar /usr/app/hello-world-1.0.0.jar
EXPOSE 8880
CMD java -jar /usr/app/hello-world-1.0.0.jar
