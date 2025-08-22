FROM maven:3-jdk-8-alpine as builder
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine
# 这里用固定文件名，避免通配符匹配多个文件导致 Kaniko 报错
COPY --from=builder /usr/src/app/target/app.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java"]
CMD ["-jar", "/app.jar"]

