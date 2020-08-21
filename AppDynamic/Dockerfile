FROM tomcat:9

# Update with your own details
ARG PACKAGE="AppServerAgent-1.8-20.7.0.30639.zip"
ARG APPDYNAMICS_AGENT_APPLICATION_NAME="demo"
ARG APPDYNAMICS_AGENT_TIER_NAME="DEV"
ARG APPDYNAMICS_AGENT_ACCOUNT_NAME=wharf202008200231402
ARG APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=gb7pufbmv6bl
ARG APPDYNAMICS_CONTROLLER_HOST_NAME="wharf202008200231402.saas.appdynamics.com"
ARG APPDYNAMICS_CONTROLLER_PORT=443
ARG APPDYNAMICS_CONTROLLER_SSL_ENABLED=true
ARG APPDYNAMICS_JAVA_AGENT_REUSE_NODE_NAME=true
ARG APPDYNAMICS_JAVA_AGENT_REUSE_NODE_NAME_PREFIX=sample

# can download from browser, but can't download with curl
# https://download.appdynamics.com/download/prox/download-file/java-jdk8/20.7.0.30639/AppServerAgent-1.8-20.7.0.30639.zip
COPY ${PACKAGE} /tmp/${PACKAGE}

RUN mkdir -p /usr/local/tomcat/appagent && \
    cd /usr/local/tomcat/appagent && \
    unzip /tmp/${PACKAGE}

# Set the value of -javaagent to the path of Java Agent file
ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/appagent/javaagent.jar"

RUN curl -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war -o /usr/local/tomcat/webapps/SampleWebApp.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
