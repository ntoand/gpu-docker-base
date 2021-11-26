FROM nvidia/cuda:11.0-base

ARG PORT
ENV PORT=${PORT}

EXPOSE $PORT

# Install anaconda
RUN apt-get update && \
    apt-get install -y wget bzip2 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh && \
    /bin/bash Anaconda3-5.3.1-Linux-x86_64.sh -b -p /opt/conda && \
    rm Anaconda3-5.3.1-Linux-x86_64.sh

ENV PATH /opt/conda/bin:$PATH
RUN pip install --upgrade pip

# Install other packages
COPY requirements_docker.txt /requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Entry
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Command
WORKDIR /working_dir
