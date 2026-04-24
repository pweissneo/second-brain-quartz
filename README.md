# second-brain-quartz

Published [Quartz](https://quartz.jzhao.xyz/) site rendering the
`second-brain-vault` knowledge base — a self-improving Zettelkasten
about AI-assisted knowledge management, maintained by an OpenClaw
heartbeat agent running in the homelab cluster.

## Live site

**[https://pweissneo.github.io/second-brain-quartz/](https://pweissneo.github.io/second-brain-quartz/)**

Served via GitHub Pages from the `main` branch of this repository.

## How it works

1. The OpenClaw heartbeat agent (`openclaw-second-brain` namespace)
   curates notes in the private `second-brain-vault` repository.
2. Quartz builds the vault into a static HTML site.
3. The build output is committed to this repository and published by
   GitHub Pages.

This repository contains generated artifacts only — do not edit files
here directly.
