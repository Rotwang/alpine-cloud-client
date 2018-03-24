FROM hub.affinitas.io/alpine:3.6
LABEL maintainer "Bartek Palmowski <rotwang at crux.org.pl>"

COPY * /root/

RUN apk update --purge; \
    apk add --purge \
        curl \
        bash \
        jq \
        git \
        py2-pip \
        ca-certificates \
        zip

RUN easy_install-2.7 \
        https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz; \
    cd /root; pip install -r awscli-requirements.txt

RUN cd /root; ./fetch-util helm.util
RUN cd /root; ./fetch-util kubectl.util
RUN cd /root; ./fetch-util terraform.util
