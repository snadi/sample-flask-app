FROM alpine:3.19

RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev 


WORKDIR /app
COPY . /app

EXPOSE 5000

RUN chmod +x gunicorn_starter.sh

ENTRYPOINT ["sh", "./gunicorn_starter.sh"]