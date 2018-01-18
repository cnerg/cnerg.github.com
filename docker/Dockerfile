FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y \
    python-pip \
    python-sphinx \
    git
RUN pip install sphinxcontrib-bibtex

# Define default command
CMD ["/bin/bash"]
