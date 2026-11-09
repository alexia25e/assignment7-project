FROM fedora:latest

# Installations
RUN dnf -y update; dnf -y upgrade
RUN dnf -y install httpd

# Runtime configs
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Content
RUN useradd -Ms /bin/sh collin
COPY index.html /var/www/html/index.html
ADD structure.tar /

