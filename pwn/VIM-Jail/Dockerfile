# Origin image
FROM ubuntu:latest

# Meta information
MAINTAINER Zouahi Hafidh "gh_zouahi@esi.dz"

# Update
RUN apt-get update

# Setup challenge environment
RUN apt-get install -y socat
RUN apt-get install -y vim

# Add new user "ctf" and set its passord to "ctf"
RUN useradd -m -d /home/prisoner -s /bin/bash prisoner
RUN echo 'prisoner:ctf' | chpasswd

# Change directory to the newly created user's directory
WORKDIR /home/prisoner/

# Change user
USER prisoner

# Copy challenge's files
COPY --chown=prisoner:prisoner vim_jail .
COPY --chown=prisoner:prisoner runserver.sh .

# Make the scripts executable
RUN chmod +x *

# Copy the readme.txt file
COPY --chown=prisoner:prisoner readme.txt .
COPY --chown=prisoner:prisoner flag.txt .

# Expose challenge's port
EXPOSE 6666

# Start the listener
ENTRYPOINT "./runserver.sh"
