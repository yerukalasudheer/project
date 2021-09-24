FROM centos
WORKDIR /opt
RUN yum install wget -y
RUN wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u302b08.tar.gz
RUN tar -xvzf OpenJDK8U-jdk_x64_linux_hotspot_8u302b08.tar.gz
RUN mv jdk8u302-b08 java8
RUN sed -i '$ a export JAVA_HOME=/opt/java8\nexport PATH=$PATH:/opt/java8/bin' /etc/profile && source /etc/profile
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.71/bin/apache-tomcat-8.5.71.tar.gz
RUN tar -xvzf apache-tomcat-8.5.71.tar.gz
RUN mv apache-tomcat-8.5.71 tomcat8
COPY /target/petclinic.war /opt/tomcat8/webapps
ENV JAVA_HOME "/opt/java8"
ENV PATH "${JAVA_HOME}/bin:${PATH}"
EXPOSE 8080
CMD ["/opt/tomcat8/bin/catalina.sh", "run"]
