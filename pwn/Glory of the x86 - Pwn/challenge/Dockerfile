FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y socat --no-install-recommends

RUN useradd -ms /bin/sh x86hacker

WORKDIR /home/x86hacker


COPY ./flag.txt ./
COPY ./prog ./


RUN chown -R root:x86hacker /home/x86hacker && \
    chmod 750 /home/x86hacker && \
    chown root:x86hacker /home/x86hacker/flag.txt && \
    chmod 440 /home/x86hacker/flag.txt && \
    chmod 555 /home/x86hacker/prog

EXPOSE 8000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
