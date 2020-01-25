# Origin image
FROM ubuntu:latest

# Meta information
MAINTAINER Zouahi Hafidh "gh_zouahi@esi.dz"

# Update
RUN apt-get update

# Setup challenge environment
RUN apt-get install -y openssh-server
RUN apt-get install -y vim

# Add new user "ctf" and set its passord to "ctf"
RUN useradd -m -d /home/prisoner -s /bin/bash prisoner
RUN echo 'prisoner:prisoner' | chpasswd

# Change directory to the newly created user's directory
WORKDIR /home/prisoner/

# Copy the readme.txt and flag.txt
COPY readme.txt .
COPY flag.txt .

# Setup challenge
USER prisoner
RUN echo '/usr/bin/vim readme.txt' >> .bashrc
RUN echo 'exit' >> .bashrc

# Back to root
USER root

# Expose challenge's port
EXPOSE 22

# Start the listener
ENTRYPOINT service ssh start && /bin/bash
