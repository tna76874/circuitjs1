FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

COPY ./build /app

RUN apt-get update && apt-get install -y sudo wget unzip python3
RUN chmod +x dev.sh && sudo ./dev.sh setup && sudo ./dev.sh compile -strict -logLevel DEBUG
RUN ln -s $(which python3) /usr/local/bin/python

EXPOSE 8000
EXPOSE 9876

CMD ["sudo", "./dev.sh", "start"]