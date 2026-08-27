# Stage 1: Copy compiled JAR from your target folder
FROM --platform=linux/amd64 eclipse-temurin:17-jre-alpine AS jar
WORKDIR /app
COPY target/*.jar app.jar

# Stage 2: Build the clean, minimal runtime layer
FROM --platform=linux/amd64 eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=jar /app/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
