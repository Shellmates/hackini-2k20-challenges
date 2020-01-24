# Origin image
FROM ubuntu:18.04

# Meta information
MAINTAINER Zouahi Hafidh "gh_zouahi@esi.dz"

# Update
RUN apt-get update

# Setup challenge environment
RUN apt-get install -y socat
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install pyqrcode

# Add new user "ctf" and set its passord to "ctf"
RUN useradd -m -d /home/ctf -s /bin/bash ctf
RUN echo 'ctf:ctf' | chpasswd

# Change directory to the newly created user's directory
WORKDIR /home/ctf/

# Copy challenge's files
COPY bequick.py .
COPY runserver.sh .
COPY run.sh .

# Make the scripts executable
RUN chmod +x *

# Expose challenge's port
EXPOSE 1337

# Start the listener
ENTRYPOINT "./runserver.sh"
