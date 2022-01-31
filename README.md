# Official Nix templates

Templates are there to help you start your Nix project.

```console
$ nix flake init --template templates#full
```

or

```console
$ nix flake new --template templates#full ./my-new-project
```

Each template ships with a tutorial (`README.md`) which explains in details how
to use it and extend it.


# How to contribute

Main purpose of this repository is to collect most common templates to *help
newcomers learn Nix*. For this purpose the collection of templates is limited
to provided an opinionated and curated list.

Other templates for more advanced topics can be found in
[nix-community/templates](https://github.com/nix-community/templates).

TODO: templates should be also discoverable on search.nixos.org


## Opening issues

* Make sure you have a [GitHub account](https://github.com/signup/free)
* Make sure there is no open issue on the topic
* [Submit a new issue](https://github.com/NixOS/templates/issues/new)


## What is required to submit a template?

Each template needs:

- `name`

  Folder with the same name should be created and this is a location of the
  template. An entry with `name` is requred in `flake.nix`.

- `description`

  A description that explains the content of the template in one sentence. An
  entry with `description` is requred in `flake.nix`.

- `maintainers`

  Each template needs one of more maintainers with the knowledge of specific
  area. Each template has an entry in `.github/CODEOWNERS` with maintainers
  next to them.

- `tutorial`

  Tutorial showing the usage of the template should be placed in `README.md`.


# License

Note: contributing implies licensing those contributions
under the terms of [COPYING](COPYING), which is the MIT license.
