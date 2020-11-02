FROM sonarqube:6.3.1
MAINTAINER JazzOSS Team

RUN apt-get update && apt-get install -y && wget -O extensions/plugins/sonar-dependency-check-plugin-1.1.0.jar https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/1.1.0/sonar-dependency-check-plugin-1.1.0.jar && chown sonarqube:sonarqube extensions/plugins/sonar-dependency-check-plugin-1.1.0.jar
