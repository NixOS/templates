{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (system: pkgs: {
      hello = pkgs.hello;

      default = inputs.self.packages.${system}.hello;
    }) inputs.nixpkgs.legacyPackages;
  };
}
