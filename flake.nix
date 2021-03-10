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

    };

    defaultTemplate = self.templates.trivial;

  };
}
