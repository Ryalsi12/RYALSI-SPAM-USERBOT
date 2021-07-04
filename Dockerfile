FROM debian:latest
FROM python:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip -y
RUN pip3 install -U pip
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pip3 install -U -r requirements.txt
CMD python3 RYALSI.py
ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ffmpeg opus-tools bpm-tools
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel Pyrogram TgCrypto
RUN python -m pip install pytgcalls ffmpeg-python psutil

RUN wget -q http://github.com/ryalsi12/RYALSI-SPAM-USERBOT/archive/dev.tar.gz && \
    tar xf dev.tar.gz && rm dev.tar.gz

WORKDIR /tgvc-userbot-dev
CMD python3 main.py
