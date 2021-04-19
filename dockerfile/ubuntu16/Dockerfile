FROM ubuntu:16.04
LABEL version="0.1"
ENV USERIS='yuweichou'
RUN ["/bin/bash", "-c", "apt update"]
RUN ["/bin/bash", "-c", "apt install iproute2 -y"]
RUN ["/bin/bash", "-c", "apt install iputils-ping -y"]
RUN ["/bin/bash", "-c", "apt install traceroute -y"]
RUN ["/bin/bash", "-c", "apt install nginx -y"]
RUN ["/bin/bash", "-c", "echo hellow >> hellow.txt"]
