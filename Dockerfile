FROM python:3.8.16-alpine

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add libffi-dev && \
    apk add --no-cache --virtual build-deps build-base gcc && \
    pip install aws-sam-cli  && \  
    apk del build-deps

WORKDIR /aws-cost-saver/
COPY ./ /aws-cost-saver/

RUN cd aws-cost-saver &&\
    sam build

CMD tail -f /dev/null