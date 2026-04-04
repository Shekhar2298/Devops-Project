FROM tomcat:9

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY index.html /usr/local/tomcat/webapps/ROOT/
COPY style.css /usr/local/tomcat/webapps/ROOT/
