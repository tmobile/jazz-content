# Base Image and maintainer info
FROM jenkins/jenkins:2.121.3
MAINTAINER JazzOSS Team

# Switching to root to configure the image with system packages
USER root
ARG adminpass
ENV JENKINS_USER admin
ENV JENKINS_PASS $adminpass
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY jenkins/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

ARG goVersion=1.10.3

RUN apt-get update && apt-get install -y vim curl sudo libtool autoconf make unzip rsync gcc autogen shtool pkg-config lsb-release python python-dev python-pip python-setuptools groff less libxml-xpath-perl zip \
python3.5 python3-dev python3-pip build-essential libssl-dev libffi-dev && curl https://bootstrap.pypa.io/get-pip.py | python && pip install --upgrade awscli && apt-get clean && pip install virtualenv && /usr/bin/easy_install virtualenv && \
wget -O /opt/apache-maven-3.5.2-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz && \
tar xzvf /opt/apache-maven-3.5.2-bin.tar.gz -C  /opt && export PATH=$PATH:/opt/apache-maven-3.5.2/bin >> /etc/profile.d/maven.sh && ln -sf /opt/apache-maven-3.5.2/bin/mvn /usr/bin/mvn && \
curl -sL https://deb.nodesource.com/setup_8.x | bash && apt-get install -y nodejs && npm install  -global serverless@1.30 @angular/cli@1.7.3 jshint && \
wget -O /opt/sonar-scanner-cli-3.0.3.778-linux.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && \
unzip /opt/sonar-scanner-cli-3.0.3.778-linux.zip -d /opt && chown -R jenkins:jenkins /opt/sonar-scanner-3.0.3.778-linux && \
ln -sf /opt/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner /bin/sonar-scanner && mkdir /var/log/depcheck_jazz/ && \
mkdir /var/log/depcheck_jazz/nistfiles && chown -R jenkins:jenkins /var/log/depcheck_jazz/ && \
wget -O /opt/dependency-check-3.2.1-release.zip https://bintray.com/jeremy-long/owasp/download_file?file_path=dependency-check-3.2.1-release.zip && \
unzip /opt/dependency-check-3.2.1-release.zip -d /opt && chown -R jenkins:jenkins /opt/dependency-check && \
ln -sf /opt/dependency-check/bin/dependency-check.sh /bin/dependency-check.sh && \
wget -O /opt/checkstyle-7.6-all.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-7.6.1/checkstyle-7.6.1-all.jar

# Setting alias for python2 and python3
RUN alias python=/usr/bin/python && alias python3=/usr/bin/python3
# Install scripts for golang
RUN curl -O https://storage.googleapis.com/golang/go${goVersion}.linux-amd64.tar.gz && tar -xvf go${goVersion}.linux-amd64.tar.gz && mv go /usr/local
ENV GOROOT /usr/local/go
ENV GOBIN  /usr/local/go/bin
ENV GOPATH /usr/local/go/src
ENV PATH $GOROOT:$GOBIN:$GOPATH:$PATH
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Copying plugins list. Downlading and installing plugins from Jenkins PluginsManager
COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ADD jenkins/files/xmls.tar /var/jenkins_home/
COPY --chown=jenkins:jenkins jenkins/files/encrypt.groovy /var/jenkins_home/
COPY --chown=jenkins:jenkins jenkins/files/credentials.xml /var/jenkins_home/
COPY --chown=jenkins:jenkins jenkins/files/config.xml /var/jenkins_home/
COPY --chown=jenkins:jenkins jenkins/files/scriptApproval.xml /var/jenkins_home/

# Switching back to Jenkins user for safety
USER jenkins

# Expose the jenkins port
EXPOSE 8081
