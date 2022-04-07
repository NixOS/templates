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

      go-hello = {
        path = ./go-hello;
        description = "A simple Go package";
      };

    };

    defaultTemplate = self.templates.trivial;

  };
}
