#!/bin/bash

mkdir -p /app/logs

pdflatex --output-directory=logs "tex/cv.tex";

# Move pdf files to pdf folder.
mkdir -p /app/pdf
mv /app/logs/cv.pdf /app/pdf/niels-degrande-cv.pdf

