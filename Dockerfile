FROM adoptopenjdk:11-jre-hotspot
VOLUME /tmp
ADD target/*.jar app.jar
CMD ["java", "-jar", "app.jar", "--soring.profiles.active=prod"]
EXPOSE 8891