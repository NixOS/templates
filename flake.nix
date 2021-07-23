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

      gnu-hello = {
        path = ./gnu-hello;
        description = "An over-engineered flake for GNU Hello";
      };

    };

    defaultTemplate = self.templates.trivial;

  };
}
