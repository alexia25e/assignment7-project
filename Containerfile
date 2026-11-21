FROM fedora:latest

# Installations
RUN dnf -y update; dnf -y upgrade
RUN dnf -y install httpd

# Content
COPY index.html /var/www/html/index.html
RUN useradd -Ms /bin/sh collin; mkdir /structure; chmod 777 /structure
WORKDIR /structure
USER sync
RUN mkdir sync-work
USER nobody
RUN mkdir nobody-work
USER root

# Runtime
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

