FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
ADD word2vec-api /word2vec
WORKDIR /word2vec
RUN pip3 install -r requirements.txt
WORKDIR /word2vec
ENTRYPOINT ["python3"]
CMD ["word2vec-api.py", "--model", "/data/test.model"]
