FROM ubuntu:16.04

RUN apt update \
    && apt install -y \
         default-jre default-jdk maven \
    ;


COPY . /app/

WORKDIR /app/

RUN mvn clean package

EXPOSE  8080

CMD ["mvn", "spring-boot:run", "-Drun.arguments='spring.profiles.active=test'"]
