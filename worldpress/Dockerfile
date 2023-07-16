# FROM dibian:lastest
FROM debian:buster


RUN apt-get update
RUN apt-get install -y python3

COPY test.py .
CMD ["python3","test.py"]

