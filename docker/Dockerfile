FROM ubuntu:20.04

RUN apt-get -y update
RUN apt-get install -y \
    ruby-full \
    build-essential \
    zlib1g-dev

RUN gem install jekyll bundler


# Define default command
CMD ["/bin/bash"]
