FROM tomcat:9

ARG APP_NAME="demo"
ARG NEW_RELIC_LICENSE_KEY="your_license_key"

# Add the newrelic.jar and -javaagent parameters
RUN mkdir -p /usr/local/tomcat/newrelic

RUN curl -L -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && \
    unzip newrelic-java.zip && \
    rm -f newrelic-java.zip

ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/newrelic/newrelic.jar"

RUN sed -i "s/<%= license_key %>/${NEW_RELIC_LICENSE_KEY}/" /usr/local/tomcat/newrelic/newrelic.yml

# An example of setting a system property config
ENV JAVA_OPTS="$JAVA_OPTS -Dnewrelic.config.app_name=${APP_NAME}"

# Config to include the agent logs in Docker's stdout logging
ENV JAVA_OPTS="$JAVA_OPTS -Dnewrelic.config.log_file_name=STDOUT"

RUN curl -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war -o /usr/local/tomcat/webapps/SampleWebApp.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
