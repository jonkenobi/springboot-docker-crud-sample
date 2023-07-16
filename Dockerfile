FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN chmod +x gradlew
RUN ./gradlew bootJar -x test
RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM eclipse-temurin:17-jdk-alpine

## TBD finish injecting this arg with CodeBuild's environment variables. This DB endpoint is terminated ofc, just an example.
#ARG DB_URL=jdbc:mysql://springboot-docker.cx01j6zmiduj.ap-northeast-1.rds.amazonaws.com:3306/springboot
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","-Dspring.datasource.url=jdbc:mysql://springboot-docker.cx01j6zmiduj.ap-northeast-1.rds.amazonaws.com:3306/springboot", "app.jar"]
#ENTRYPOINT ["java","-jar","-Dspring.datasource.url=${DB_URL}", "app.jar"]
