# LaTeX template

A LaTeX template for scientific writing, with a focus on reproducibility and ease of use.

## Usage instructions

### Build PDF

Author changes in `main.tex` and `references.bib` as needed, and then compile to PDF with:

```sh
nix build
```

and look in the `result` directory for the PDF.

### Interactive watch mode

Have `latexmk` continuously watch for changes and recompile the PDF:

```sh
nix develop
latexmk -interaction=nonstopmode -auxdir=.cache/latex -pdf -pvc main.tex
```

### Reduce size of build environment

If you know you won't need all the LaTeX packages included with TeX Live, you can make the build environment smaller by replacing `texliveFull` in `buildInputs` with `texlive.combine` and including only what you need. For example:

```nix
(texlive.combine { inherit (texlive) latexmk scheme-basic biblatex biber; })
```

However, by doing this you'll need to find the corresponding Nix package in the `nixpkgs` repository, and add it to the environment manually whenever you want to include a new LaTeX package. For this reason, it can be easier during writing to just use `texliveFull` unless you have a specific need not to.
