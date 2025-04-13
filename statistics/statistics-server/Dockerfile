FROM amazoncorretto:11
COPY target/statistics-server-0.0.1-SNAPSHOT.jar /app/statistics-server.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "statistics-server.jar"]