# Codebase Overview

This repository is a personal workspace mainly used for building a résumé in LaTeX and sharing documentation about Dolfo and his interests. The top-level structure is simple:

```
BOOKSHELF.md   - Reading recommendations
LICENSE
README.md      - Introductory info
resume/        - LaTeX résumé and build support
user-manual/   - "User manual" describing how Dolfo works
.github/workflows/ - CI pipelines for Docker image and résumé release
```

## Root README
The main README introduces Dolfo and points to the résumé and user manual.

## User Manual
`user-manual/README.md` provides details about Dolfo's work style and preferences.

## Bookshelf
`BOOKSHELF.md` lists recommended reading grouped by topic.

## Résumé Folder
The `resume/` directory contains LaTeX sources and a Dockerfile used to build the résumé PDF.

## GitHub Actions
Workflows under `.github/workflows` build the Docker image and release the résumé automatically.

## Key Takeaways for Newcomers
- This repo is centered around personal documentation and résumé generation.
- The résumé is built using TinyTeX and a custom Docker image defined in `resume/Dockerfile`.
- GitHub Actions automate image building and release creation.
- Check out the user manual and bookshelf for insight into Dolfo's style and interests.

## Where to Learn More
1. Learn some LaTeX basics to understand `resume/resume.tex`.
2. Explore Dockerfile authoring to see how the résumé image is built.
3. Review the GitHub Actions workflows to understand the automation pipeline.
4. Browse the documentation files for examples of Markdown usage.
