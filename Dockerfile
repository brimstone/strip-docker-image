FROM alpine

RUN apk update && apk add tar

COPY strip-docker-image /

COPY tests /tests

ENTRYPOINT ["/strip-docker-image"]
