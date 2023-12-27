FROM python:3-slim-buster
WORKDIR /usr/src/app
COPY requirements.txt .
RUN apt update && apt install xmlsec1 -y && pip3 install -r requirements.txt && apt clean
COPY app .
EXPOSE 8080
CMD [ "gunicorn", "-b", "0.0.0.0:8080", "main:app" ]
