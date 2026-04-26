FROM debian:bookworm-slim AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential cmake pkg-config \
        libboost-system-dev libboost-dev \
        libavcodec-dev libavformat-dev libavutil-dev libswresample-dev \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY CMakeLists.txt ./
COPY src src
RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build -j

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
        libboost-system1.74.0 \
        libavcodec59 libavformat59 libavutil57 libswresample4 \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r app && useradd -r -g app app
WORKDIR /app
COPY --from=builder /build/build/audio_service /app/app
USER app
EXPOSE 50023
ENTRYPOINT ["/app/app"]
