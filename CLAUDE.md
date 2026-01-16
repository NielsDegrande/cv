# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains Niels Degrande's CV, built as a LaTeX document and deployed to GitHub Pages as a PDF. The build process uses Docker to ensure consistent LaTeX rendering across environments.

## Build System

### Building the PDF

The primary command to generate the CV PDF:

```bash
make produce_pdf
```

This command:

1. Builds a Docker image with LaTeX dependencies (Debian-based with texlive packages)
2. Runs the container to compile `tex/cv.tex` using pdflatex
3. Outputs the PDF to `pdf/niels-degrande-cv.pdf`
4. Logs are generated in the `logs/` directory

### Docker Workflow

The build uses a containerized approach to ensure reproducibility:

- **Dockerfile**: Debian stable-slim with texlive-latex-base, texlive-fonts-*, and texlive-latex-extra
- **Build script**: `scripts/produce_pdf.sh` runs pdflatex and moves the output to `pdf/`
- Volume mounting: The entire repository is mounted at `/app` in the container

### Individual Make Targets

```bash
make help          # Show available commands
make build_latex   # Build just the Docker image (without running)
```

## Repository Structure

```
cv/
├── tex/cv.tex              # Main LaTeX source file
├── scripts/produce_pdf.sh  # PDF generation script (runs inside Docker)
├── Dockerfile              # LaTeX build environment
├── Makefile                # Build automation
└── .github/workflows/cd.yaml  # CI/CD pipeline
```

## LaTeX Document Structure

The CV (`tex/cv.tex`) uses a custom document class with:

- **Custom commands**: `\contact{}`, `\header{}`, `\experience{}` for consistent formatting
- **Packages**: fontawesome (icons), geometry (margins), hyperref (links)
- **Layout**: Single-page format with custom bullet lists and spacing

When editing the CV, use the existing custom commands rather than raw LaTeX to maintain consistency.

## CI/CD

The GitHub Actions workflow (`.github/workflows/cd.yaml`) automatically:

1. Triggers on pushes to `main` that modify `tex/cv.tex` or `404.html`
2. Builds the PDF using `make produce_pdf`
3. Deploys both the PDF and 404 page to GitHub Pages

The deployed site serves the PDF directly, making it accessible at the GitHub Pages URL.
