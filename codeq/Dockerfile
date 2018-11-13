FROM sonarqube:lts
MAINTAINER JazzOSS Team

RUN apt-get update && apt-get install -y && wget -O extensions/plugins/sonar-dependency-check-plugin-1.1.0.jar https://bintray.com/stevespringett/owasp/download_file?file_path=org%2Fsonarsource%2Fowasp%2Fsonar-dependency-check-plugin%2F1.1.0%2Fsonar-dependency-check-plugin-1.1.0.jar && chown sonarqube:sonarqube extensions/plugins/sonar-dependency-check-plugin-1.1.0.jar
