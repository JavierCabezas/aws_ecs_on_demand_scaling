FROM python:3.8.16-alpine

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add nano && \
    apk add libffi-dev && \
    apk add --no-cache --virtual build-deps build-base gcc && \
    pip install aws-sam-cli  && \  
    apk del build-deps

WORKDIR /aws-cost-saver/
COPY ./ /aws-cost-saver/

#COPY AWS CREDENTIALS
RUN mkdir ~/.aws && cp /aws-cost-saver/aws_credentials ~/.aws/credentials

#INSTALL AWS CLI
RUN apk add --no-cache aws-cli

#Install SAM and build
RUN cd aws-cost-saver &&\
    sam build

CMD tail -f /dev/null