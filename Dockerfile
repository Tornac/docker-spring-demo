FROM gradle:7.3.1-jdk11 AS build
WORKDIR /home/gradle/src
COPY gradle build.gradle.kts gradlew settings.gradle.kts ./
RUN gradle build --no-daemon || true
COPY src src
RUN gradle build --no-daemon

FROM openjdk:11-jre-slim
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
ENTRYPOINT ["java", "-jar", "/app/spring-boot-application.jar"]
