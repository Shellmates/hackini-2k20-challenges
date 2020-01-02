# Origin image
FROM ubuntu:latest

# Meta information
MAINTAINER Zouahi Hafidh "gh_zouahi@esi.dz"

# Update
RUN apt-get update

# Setup challenge environment
RUN apt-get install -y apache2

# Clean web root
RUN rm -rf /var/www/html
RUN mkdir /var/www/html

# Change directory to web root
WORKDIR /var/www/html/

# Copy challenge's file
COPY index.html .

# Expose challenge's port
EXPOSE 80

# Start the web server
ENTRYPOINT service apache2 start && tail -f /dev/null
