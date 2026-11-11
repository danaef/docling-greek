FROM quay.io/docling-project/docling-serve-cpu:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tesseract-ocr \
        tesseract-ocr-ell \
        tesseract-ocr-eng && \
    rm -rf /var/lib/apt/lists/*

# Check installed OCR languages during build
RUN tesseract --list-langs

# Restore the container's non-root runtime user
USER 1001
