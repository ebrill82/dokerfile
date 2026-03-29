FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git cmake g++ \
    libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libsndfile1-dev libopenal-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN git clone https://github.com/pman93/OpenClaw.git .
RUN mkdir build && cd build && cmake .. && make -j$(nproc)
CMD ["./build/openclaw"]