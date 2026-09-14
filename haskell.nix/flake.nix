{
  # This is a template created by `hix init`
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      haskellNix,
    }:
    let
      # x86_64-darwin is excluded: haskell.nix follows nixpkgs-unstable, which
      # has dropped x86_64-darwin support (see nixpkgs 26.11 release notes).
      # aarch64-linux and aarch64-darwin are excluded: `nix flake check`
      # realises hydraJobs derivations (e.g. GHC, spdx-json) for every listed
      # system, which needs a registered builder for that foreign system that
      # plain CI runners don't have.
      supportedSystems = [
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (
      system:
      let
        overlays = [
          haskellNix.overlay
          (final: prev: {
            hixProject = final.haskell-nix.hix.project {
              src = ./.;
              evalSystem = "x86_64-linux";
            };
          })
        ];
        pkgs = import nixpkgs {
          inherit system overlays;
          inherit (haskellNix) config;
        };
        flake = pkgs.hixProject.flake { };
      in
      flake
      // {
        legacyPackages = pkgs;

        packages = flake.packages // {
          default = flake.packages."hello:exe:hello";
        };
      }
    );

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use the IOG nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [ "https://cache.iog.io" ];
    extra-trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    allow-import-from-derivation = "true";
  };
}
