# Origin image
FROM ubuntu:latest

# Meta information
MAINTAINER Zouahi Hafidh "gh_zouahi@esi.dz"

# Update
RUN apt-get update

# Setup challenge requirements
RUN apt-get install -y socat
RUN apt-get install -y cron
RUN apt-get install -y python3

# Add user "sysadmin"
RUN useradd -m -d /home/sysadmin -s /bin/bash sysadmin
RUN echo 'sysadmin:f53796f924d3ba088c02e963db04d26a' | chpasswd

# Add user "ctf"
RUN useradd -m -d /home/ctf -s /bin/bash ctf
RUN echo 'ctf:ctf' | chpasswd

# Setup vulnerable environment
WORKDIR /home/sysadmin
COPY --chown=sysadmin:sysadmin backup.py .
COPY --chown=sysadmin:sysadmin crontab.sysadmin .
COPY --chown=sysadmin:sysadmin flag.txt .
RUN chmod 400 flag.txt

WORKDIR /home/ctf
COPY --chown=ctf:ctf runserver.sh .

# Expose challenge's port
EXPOSE 7777

# Start the listener
ENTRYPOINT service cron start && su sysadmin -c "crontab /home/sysadmin/crontab.sysadmin" && su ctf -c /home/ctf/runserver.sh
