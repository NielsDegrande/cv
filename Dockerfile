FROM debian:stable-slim

LABEL NAME=latex-builder
LABEL VERSION=1.0.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /app

ENTRYPOINT ["bash", "/app/scripts/produce_pdf.sh"]
