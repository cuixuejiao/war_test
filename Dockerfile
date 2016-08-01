#android development environment based on Ubuntu latest LTS.
# version 0.0.1

FROM ubuntu:latest
MAINTAINER cuicui "cui.xuejiao@msn.com"
ENV REFESHED_AT 2016-07-27

# Gradle
ENV GRADLE_VERSION 2.14.1

RUN apt-get update -yqq
RUN apt-get install -yqq curl zip 
RUN curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip
RUN unzip gradle-bin.zip
RUN ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle && rm gradle-bin.zip

# Set Environmental Variables
ENV GRADLE_HOME /usr/lib/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

WORKDIR $PWD/war_test

# Caches
VOLUME ["/root/.gradle/caches", $WORKDIR]
ENTRYPOINT ["gradle"]
CMD ["-version"]
