# springboot-rhel7
#
# This image provide a base for running Spring Boot based applications. It
# provides a base Java 8 installation.

FROM openshift/base-rhel7

EXPOSE 8080

ENV JAVA_VERSON 1.8.0

LABEL io.k8s.description="Platform for running Spring Boot applications" \
      io.k8s.display-name="Spring Boot" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,springboot"

RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSON-openjdk java-$JAVA_VERSON-openjdk-devel && \
  yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

# Add configuration files, bashrc and other tweaks
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

RUN chown -R 1001:0 /opt/app-root
USER 1001

# Set the default CMD to print the usage of the language image
CMD $STI_SCRIPTS_PATH/usage
