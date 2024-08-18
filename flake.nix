{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {

      trivial = {
        path = ./trivial;
        description = "A very basic flake";
      };

      simpleContainer = {
        path = ./simple-container;
        description = "A NixOS container running apache-httpd";
      };

      python = {
        path = ./python;
        description = "Python template, using poetry2nix";
        welcomeText = ''
          # Getting started
          - Run `nix develop`
          - Run `poetry run python -m sample_package`
        '';
      };

      rust = {
        path = ./rust;
        description = "Rust template, using Naersk";
      };

      bash-hello = {
        path = ./bash-hello;
        description = "An over-engineered Hello World in bash";
      };

      c-hello = {
        path = ./c-hello;
        description = "An over-engineered Hello World in C";
      };

      ruby = {
        path = ./ruby;
        description = "Flake for building ruby gems" ;
        welcomeText = ''
          # Simple Ruby Gem Template
          ## Intended usage
          The intended usage of this flake is to facilitate building ruby gems

          ## More info
          - [Ruby language](https://www.ruby-lang.org/)
          - [Ruby in the NixOS manual](https://nixos.org/manual/nixpkgs/stable/#sec-language-ruby)
        '';
      };

      rust-web-server = {
        path = ./rust-web-server;
        description = "A Rust web server including a NixOS module";
      };

      compat = {
        path = ./compat;
        description = "A default.nix and shell.nix for backward compatibility with Nix installations that don't support flakes";
      };

      haskell-hello = {
        path = ./haskell-hello;
        description = "A Hello World in Haskell with one dependency";
      };

      hercules-ci = {
        path = ./hercules-ci;
        description = "An example for Hercules-CI, containing only the necessary attributes for adding to your project.";
      };

      full = {
        path = ./full;
        description = "A template that shows all standard flake outputs";
        welcomeText = ''
          You just created a template that will show you all standard flake outputs.

          Read more about it here:

            https://github.com/NixOS/templates/tree/master/full
        '';
      };

      pandoc-xelatex = {
        path = ./pandoc-xelatex;
        description = "A report built with Pandoc, XeLaTex and a custom font";
      };

      latexmk = {
        path = ./latexmk;
        description = "A simple LaTeX template for writing documents with latexmk";
      };

      go-hello = {
        path = ./go-hello;
        description = "A simple Go package";
      };

      empty = {
        path = ./empty;
        description = "A flake with no outputs";
      };

      haskell-nix = {
        path = ./haskell.nix;
        description = "An haskell.nix template using hix";
        welcomeText = ''
          You just created an haskell.nix template using hix. Read more about it here:
          https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-flakes.html
        '';
      };

      haskell-flake = {
        path = ./haskell-flake;
        description = "A haskell-flake template";
        welcomeText = ''
          You just created a haskell-flake template.
          See the README or https://github.com/srid/haskell-flake.
        '';
      };

      utils-generic = {
        path = ./utils-generic;
        description = "Simple, all-rounder template with utils enabled and devShell populated";
      };

      dotnet = {
        path = ./dotnet;
        description = "A .NET application and test project";
      };

      typescript-pnpm = {
        path = ./typescript/pnpm;
        description = "A template combining a node webserver and a dev environment
            for frontend typescript development";
        welcomeText = ''
          # Getting Started
          - run `nix develop` to enter the development environment
          - run `pnpm install` to install the packaged
          - run `pnpm start` to open a live reloading website
        '';
      };

      typescript-p5js = {
        path = ./typescript/pnpm-p5js;
        description = "A template combining a node webserver and a dev environment
            for frontend typescript development";
        welcomeText = ''
          # Getting Started
          - run `nix develop` to enter the development environment
          - run `pnpm install` to install the packaged
          - run `pnpm start` to open a live reloading website
        '';
      };
    };

    defaultTemplate = self.templates.trivial;

  };
}
