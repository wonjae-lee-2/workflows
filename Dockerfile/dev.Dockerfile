FROM python:3.11.2

RUN apt update && \
    apt install -y --no-install-recommends unixodbc-dev && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -u 1000 -m ubuntu
WORKDIR /home/ubuntu
USER ubuntu

COPY Dockerfile/requirements.txt requirements.txt
RUN python -m pip install pip==23.0.1 && \
    python -m pip install setuptools==67.3.2 && \
    python -m pip install wheel==0.38.4 && \
    python -m pip install -r requirements.txt

CMD [ "/bin/bash" ]
