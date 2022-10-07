FROM java

COPY ./target/demo-docker*.jar /usr/app/dockerDemo.jar

WORKDIR /usr/app

EXPOSE 8082

ENTRYPOINT ["java","-jar","dockerDemo.jar"]
