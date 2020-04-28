FROM tomcat:8
RUN mv webpps webapps2
RUN mv webapps.dist webapps
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
