FROM python:3.7
RUN apt-get update -y \
    # && apt-get install -y --no-install-recommends \
    && apt-get install -y \
        # python3.8-dev \
        apt-utils \
        ffmpeg \
        sox \
        libcairo2-dev \
        texlive \
        texlive-fonts-extra \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-science \
        tipa \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY src/* /manim/
COPY .git /manim/
    # && add-apt-repository universe \

# RUN cd /manim \
#     && python setup.py sdist \
#     && python -m pip install dist/manimlib*
RUN cd /manim \
     && python -m pip install manimlib
#     && python -m pip3 install manimlib*


# # if you want the gui in windows: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
RUN cd /usr/local && \
    wget https://download.jetbrains.com/python/pycharm-community-2020.2.tar.gz && \
    tar -xvf pycharm-community-2020.2.tar.gz && \
    rm pycharm-community-2020.2.tar.gz



ENTRYPOINT ["/bin/bash"]
