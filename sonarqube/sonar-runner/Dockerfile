FROM sonarsource/sonar-scanner-cli:4.2
USER root
WORKDIR /usr/src
#RUN echo 'sonar.projectKey=${CICD_EXECUTION_SEQUENCE}' > /usr/src/sonar-project.properties
# RUN echo 'sonar.projectKey=docker-devops-rancher' > /usr/src/sonar-project.properties
RUN echo 'sonar.projectKey=docker-devops' > /usr/src/sonar-project.properties
COPY . .
