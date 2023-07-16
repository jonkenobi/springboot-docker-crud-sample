FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN chmod +x gradlew
RUN ./gradlew bootJar -x test
RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM eclipse-temurin:17-jdk-alpine
ENV db_url my-url
ENV db_username root
ENV db_password password
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","-Dspring.datasource.url=${db_url} -Dspring.datasource.username=${db_username} -Dspring.datasource.password=${db_password}", "app.jar"]