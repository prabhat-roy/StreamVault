# media — StreamVault

Media processing pipeline: transcoding (HLS/DASH/CMAF), thumbnails, subtitles, audio packaging.

| Service | Language | Port | Description |
|---|---|---|---|
| transcoding-service | C++ | 50020 | FFmpeg-based transcoding engine (HLS/DASH/CMAF, GPU encode) |
| thumbnail-service | go | 50021 | Sprite/storyboard thumbnail generation |
| subtitle-service | python | 50022 | Whisper-based subtitle/ASR generation, WebVTT output |
| audio-service | C++ | 50023 | Multi-language audio track packaging (AAC, EAC3, Atmos) |
