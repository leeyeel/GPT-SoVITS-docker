# Base CUDA image
FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

LABEL description="Docker image for GPT-SoVITS"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    wget git curl ca-certificates \
    libsndfile1 ffmpeg fonts-noto-cjk gcc g++ make cmake \
    python3.10 python3.10-dev python3.10-distutils python3-pip\
    libhtsengine-dev aria2\
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN python3 -m pip install --upgrade pip setuptools

RUN wget "https://files.pythonhosted.org/packages/source/p/pyopenjtalk/pyopenjtalk-0.4.0.tar.gz"
RUN TAR_FILE="pyopenjtalk-0.4.0.tar.gz" && \
    DIR_NAME="pyopenjtalk-0.4.0" && \
    tar -xzf "$TAR_FILE" && \
    rm "$TAR_FILE" && \
    CMAKE_FILE="$DIR_NAME/lib/open_jtalk/src/CMakeLists.txt" && \
    sed -i -E 's/cmake_minimum_required\(VERSION[^\)]*\)/cmake_minimum_required(VERSION 3.5...3.31)/' "$CMAKE_FILE" && \
    tar -czf "$TAR_FILE" "$DIR_NAME"
RUN TAR_FILE="pyopenjtalk-0.4.0.tar.gz" && DIR_NAME="pyopenjtalk-0.4.0" && pip install "$TAR_FILE" && \
    rm -rf "$TAR_FILE" "$DIR_NAME"

COPY requirements.txt /workspace
RUN pip install --no-cache-dir -r requirements.txt

COPY . /workspace

CMD ["python3", "webui.py"]
