FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get install -y \
    ruby-full \
    build-essential \
    zlib1g-dev

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales 

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN gem install jekyll bundler

RUN echo 'source "https://rubygems.org" ' > Gemfile; \
    echo 'gem "github-pages", group: :jekyll_plugins' >> Gemfile; \
    bundle install


# Define default command
CMD ["/bin/bash"]
