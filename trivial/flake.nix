{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      # Systems supported by this flake
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      # A helper function for specifying per-system outputs
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      # Package outputs
      packages = forEachSupportedSystem (
        { pkgs }:
        {
          # Build this by running `nix build`, `nix build .`, or `nix build .#default`
          default = pkgs.hello;
          # Build this by running `nix build .#hello`
          hello = pkgs.hello;
        }
      );
    };
}
