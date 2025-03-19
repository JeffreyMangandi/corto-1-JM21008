FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper files
COPY .mvn .mvn
COPY mvnw .
COPY mvnw.cmd .

# Copy the pom.xml and the source code
COPY pom.xml .
COPY src ./src

# Give execution rights to the Maven wrapper
RUN chmod +x mvnw

# Package the application, skipping tests
RUN ./mvnw clean package -DskipTests

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "target/*.jar"]