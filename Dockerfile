FROM openjdk
WORKDIR /usr/app
COPY ./target/spring-petclinic-2.4.2.war /usr/app
EXPOSE 8080
CMD java -jar /usr/app/spring-petclinic-2.4.2.war