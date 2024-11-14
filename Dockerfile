# Multi stage

# Build the Maven project using Java 17 --> Fra Lab øvingene
FROM maven:3.8-eclipse-temurin-17 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./java_sqs_client/src
RUN mvn package

# Use a base image with Java 17 --> Fra Lab øvingene
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar /app/application.jar
ENTRYPOINT ["java", "-jar", "/app/application.jar"]

# miljøvariabler
ENV SQS_QUEUE_URL="https://sqs.eu-west-1.amazonaws.com/244530008913/image-queue_82"



 



