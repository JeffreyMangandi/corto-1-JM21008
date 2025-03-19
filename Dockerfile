FROM openjdk:11-jre-slim
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

FROM maven:3.8.4-openjdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
COPY --from=build /target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]