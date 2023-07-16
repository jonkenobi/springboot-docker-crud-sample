FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN chmod +x gradlew
RUN ./gradlew bootJar -x test
RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM eclipse-temurin:17-jdk-alpine
ENV DB_URL jdbc:mysql://<my-url>:3306/<db>
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","-Dspring.datasource.url=${DB_URL}", "app.jar"]