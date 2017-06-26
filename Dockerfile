FROM python:2.7-alpine

LABEL maintainer "Tsuyoshi Miyake <@tsuyokb>"

RUN apk update
RUN apk add groff less openssh
RUN pip install altuscli

RUN printf "Host *\n    GatewayPorts yes\n" > /etc/ssh/ssh_config

WORKDIR /root
CMD ["sh"]
