FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install pv

RUN groupadd docker && usermod jenkins -aG docker

USER jenkins
