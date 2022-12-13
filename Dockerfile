FROM ubuntu:jammy

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --yes --no-install-recommends wget curl tree unzip zip ca-certificates sudo htop
RUN apt-get install --yes --no-install-recommends default-jre r-base r-base-dev libcurl4-openssl-dev libssl-dev libxml2-dev texlive-base texlive-xetex
RUN wget -q -O- https://eddelbuettel.github.io/r2u/assets/dirk_eddelbuettel_key.asc | tee -a /etc/apt/trusted.gpg.d/cranapt_key.asc \
    && echo "deb [arch=amd64] https://dirk.eddelbuettel.com/cranapt jammy main" > /etc/apt/sources.list.d/cranapt.list
RUN wget -q -O- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && echo "deb [arch=amd64] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" > /etc/apt/sources.list.d/cran-ubuntu.list && apt update
RUN apt-get install --yes r-cran-tidyverse r-cran-rmarkdown r-cran-magrittr r-cran-quarto r-cran-languageserver
RUN cd /tmp && wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.269/quarto-1.2.269-linux-amd64.deb && dpkg -i quarto-1.2.269-linux-amd64.deb && rm *.deb
RUN useradd -ms /bin/bash workshopper && adduser workshopper sudo
RUN groupadd docker && usermod -aG docker workshopper && echo "workshopper:workshopper" | chpasswd
# USER workshopper
# WORKDIR /home/workshopper