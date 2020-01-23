FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y socat --no-install-recommends

RUN useradd -ms /bin/sh PwnINI

WORKDIR /home/PwnINI


COPY ./flag.txt ./
COPY ./PwnINI ./


RUN chown -R root:PwnINI /home/PwnINI && \
    chmod 750 /home/PwnINI && \
    chown root:PwnINI /home/PwnINI/flag.txt && \
    chmod 440 /home/PwnINI/flag.txt

EXPOSE 8000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
