Spring Boot Running Image
========================================

Installation and Usage
------------------------

```
$ git clone https://github.com/sclorg/s2i-base-container.git
$ cd s2i-base-container
$ mv Dockerfile Dockerfile.tmp
$ mv Dockerfile.rhel7 Dockerfile
$ sudo docker build -t openshift/base-rhel7 .
$ cd ..
$ git clone https://github.com/taksato-redhat/springboot-rhel7.git
$ cd springboot-rhel7
$ sudo docker build -t openshift/springboot-rhel7 .
```
