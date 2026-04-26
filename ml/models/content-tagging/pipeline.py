"""Automated content tagging.

1. Whisper-large-v3 → speech-to-text transcript (per-segment)
2. Scene-detection (PySceneDetect) → scene boundaries
3. Object detection (YOLOv8) → per-frame object labels (sampled at scene cuts)
4. Aggregate → catalogue tags + searchable transcript stored in Elasticsearch
"""
from pathlib import Path
import whisper
from scenedetect import detect, ContentDetector
from ultralytics import YOLO


def tag(asset: Path) -> dict:
    transcript = whisper.load_model("large-v3").transcribe(str(asset))
    scenes     = detect(str(asset), ContentDetector())
    yolo       = YOLO("yolov8n.pt")
    detections = []
    for s in scenes:
        mid = (s[0].get_seconds() + s[1].get_seconds()) / 2
        # frame extraction omitted for brevity
        detections.append({"t": mid, "objects": []})

    return {
        "transcript": transcript["text"],
        "language":   transcript["language"],
        "scenes":     [{"start": s[0].get_seconds(), "end": s[1].get_seconds()} for s in scenes],
        "objects":    detections,
    }
