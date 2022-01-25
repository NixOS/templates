---
title: Article Title
subtitle: ... and subtitle
classoption:
  - a4paper
  - 12pt
mainfont: DejaVu Serif
sansfont: DejaVu Sans
documentclass: scrartcl
author: The author name goes here
geometry: "left=4cm, right=3cm, top=2.5cm, bottom=2.5cm"
numbersections: true
---

---
abstract: |

    Your abstract here 

---

# Intro {#sec:intro}

To use this template, open a new folder and type: `nix flake init -t pandoc-xelatex`. Then type `nix build` to produce a PDF from `README.md` and edit the `flake.nix` to use other files. The template can already use citations [@nixosWebsite] and references to sections, e.g. to sec [@sec:intro], figures, etc ...

# References

---
references:
- id: nixosWebsite
  author: NixOS Community
  title: Main Website
  url: https://nixos.org
  type: online

---
