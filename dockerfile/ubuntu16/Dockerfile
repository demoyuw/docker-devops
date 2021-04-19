FROM ubuntu:16.04
LABEL version="0.1"
ENV USERIS='yuweichou'
RUN ["/bin/sh", "-c", "apt update"]
RUN ["/bin/sh", "-c", "apt install iproute2 -y"]
RUN ["/bin/sh", "-c", "apt install iputils-ping -y"]
RUN ["/bin/sh", "-c", "apt install traceroute -y"]
RUN ["/bin/sh", "-c", "apt install nginx -y"]
RUN ["/bin/sh", "-c", "echo hellow >> hellow.txt"]
