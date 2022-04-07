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

Based on https://github.com/bobvanderlinden/templates/blob/master/ruby/flake.nix

To use this template, open a new folder and type: `nix flake init -t templates#ruby`. Then type `nix build` to produce `result/bin/r10k` and edit the `flake.nix` to use other files.

`nix build` works only if you execute first the following steps
```
nix-shell
bundle install
bundix -m
```

# References

---
references:
- id: nixosWebsite
  author: NixOS Community
  title: Main Website
  url: https://nixos.org
  type: online

---
