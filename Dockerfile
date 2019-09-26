From yzldocker/yzlubuntuarm64v8:apt@sha256:f29cdd17f7ecc1f702af60ddf53516381f689b190591bce508be0c80b3124696
ENV LANG C.UTF-8
WORKDIR /home
ADD requirements.txt ./
RUN pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
EXPOSE 5000
