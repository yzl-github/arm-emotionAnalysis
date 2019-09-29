From ubuntu:18.04@sha256:1bbdea4846231d91cce6c7ff3907d26fca444fd6b7e3c282b90c7fe4251f9f86
ENV LANG C.UTF-8
WORKDIR /home
RUN apt-get update
RUN apt-get install wget zip python3-pip libsm6 libxrender1 libxext-dev gcc -y
ADD requirements.txt ./
RUN pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
EXPOSE 5000
