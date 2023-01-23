FROM jenkinsci/blueocean

COPY Jenkinsfile /var/jenkins_home/Jenkinsfile

USER root
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y docker-ce

RUN usermod -aG docker jenkins

USER jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_PLUGINS_INSTALL docker-workflow

EXPOSE 8080 50000

CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
