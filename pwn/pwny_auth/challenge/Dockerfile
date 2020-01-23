FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y socat --no-install-recommends

RUN useradd -ms /bin/sh newbie

WORKDIR /home/newbie


COPY ./flag.txt ./
COPY ./pwny_auth ./

RUN chown -R root:newbie /home/newbie && \
    chmod 750 /home/newbie && \
    chown root:newbie /home/newbie/flag.txt && \
    chmod 440 /home/newbie/flag.txt && \
    chmod 555 /home/newbie/pwny_auth

EXPOSE 8000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
