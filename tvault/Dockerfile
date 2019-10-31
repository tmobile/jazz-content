FROM centos:7

RUN yum -y install vim tar gzip wget which sudo openssl initscripts java-1.8.0-openjdk glibc-common awscli net-tools git epel-release maven  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && source ~/.nvm/nvm.sh && nvm install 8.11.0 && npm install -g bower@1.8.4 && npm install gulp-cli -g && npm install gulp@3.9.1 && rm -rf /var/cache/yum/*
ADD tvault/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
EXPOSE 3000
EXPOSE 3001
