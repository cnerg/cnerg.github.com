
FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y \
    python-pip \
    python-sphinx \
    git

RUN echo 'PS1="\[$(tput setaf 3)$(tput bold)[\]appname@\\h$:\\w]#\[$(tput sgr0) \]"' >> /root/.bashrc

# Define default command
CMD ["/bin/bash"]
