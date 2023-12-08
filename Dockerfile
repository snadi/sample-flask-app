FROM alpine:latest

RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev 

RUN pip install --upgrade pip

WORKDIR /app
COPY . /app

RUN pip --no-cache-dir install -r requirements.txt

# "EXPOSE" only exposes the container's port to be visible to others, but not to host.
# We will map ports inside docker-compose.yml
EXPOSE 5000
EXPOSE 8081

RUN chmod +x gunicorn_starter.sh

ENTRYPOINT ["sh", "./gunicorn_starter.sh"]