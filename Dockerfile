FROM java:openjdk-8u111-alpine
RUN apk --no-cache add curl
COPY build/libs/*-all.jar lab-micronaut.jar
CMD java ${JAVA_OPTS} -jar lab-micronaut.jar