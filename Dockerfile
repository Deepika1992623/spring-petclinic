FROM openjdk:latest
# Environment Variable that defines the endpoint of sentiment-analysis python api.
ENV SA_LOGIC_API_URL http://localhost:5000
ADD target/spring-petclinic-2.7.0-SNAPSHOT.jar /
EXPOSE 1234
CMD ["java", "-jar", "spring-petclinic-2.7.0-SNAPSHOT.jar", "--sa.logic.api.url=${SA_LOGIC_API_URL}"]

#this is test line for git test
