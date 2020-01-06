FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y socat --no-install-recommends

RUN useradd -ms /bin/sh CryptoBoy

WORKDIR /home/CryptoBoy


COPY ./flag.txt ./
COPY ./otp_leak ./

# ONE_TIME_PAD 
ENV ONE_TIME_PAD=YOIQsSNT2tSO5GMUnApdvnegKyYyUG52

RUN chown -R root:CryptoBoy /home/CryptoBoy && \
    chmod 750 /home/CryptoBoy && \
    chown root:CryptoBoy /home/CryptoBoy/flag.txt && \
    chmod 440 /home/CryptoBoy/flag.txt

EXPOSE 8000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
