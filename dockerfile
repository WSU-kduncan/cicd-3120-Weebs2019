FROM httpd:latest
WORKDIR .
COPY ./website/index.html /usr/local/apache2/htdocs/
RUN apt update -y
EXPOSE 80
