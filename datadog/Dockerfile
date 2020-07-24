FROM tomcat:9

ARG APP_NAME="demo"
ARG APP_ENV="dev"
ARG DATADOG_LICENSE="your_license_key"

# Install host agent
#RUN DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=${DATADOG_LICENSE} DD_SITE="datadoghq.com" bash -xc "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

ADD install_script.sh ./install_script.sh
RUN chmod +x install_script.sh && \
    DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=${DATADOG_LICENSE} DD_SITE="datadoghq.com" bash -x ./install_script.sh

# copy the license
ADD datadog.yaml /etc/datadog-agent/datadog.yaml

# Add the newrelic.jar and -javaagent parameters
RUN mkdir -p /usr/local/tomcat/datadog

RUN wget -O /usr/local/tomcat/datadog/dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'

ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/datadog/dd-java-agent.jar"

# An example of setting a system property config
ENV JAVA_OPTS="$JAVA_OPTS -Ddd.profiling.enabled=true -Ddd.logs.injection=true -Ddd.service=${APP_NAME} -Ddd.env=${ENV}"

RUN curl -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war -o /usr/local/tomcat/webapps/SampleWebApp.war

EXPOSE 8080

ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

CMD ["bash", "./entrypoint.sh"]
