FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY /build/libs/crud-sample-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

# syntax=docker/dockerfile:experimental
#FROM eclipse-temurin:17-jdk-alpine as build
#WORKDIR /workspace/app
#
#COPY mvnw .
#COPY .mvn .mvn
#COPY pom.xml .
#COPY src src
#
#RUN --mount=type=cache,target=/root/.m2 ./mvnw install -DskipTests
#RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

#FROM eclipse-temurin:17-jdk-alpine
#VOLUME /tmp
#ARG DEPENDENCY=/workspace/app/target/dependency
#COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
#COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
#ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]