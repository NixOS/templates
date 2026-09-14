{
  # This is a template created by `hix init`
  #
  # haskellNix is pinned to a revision whose nixpkgs-unstable still has
  # spdx-license-list-data 3.27.0, matching haskell.nix's last materialized
  # SPDX license cache (haskell.nix/materialized/spdx-3.27.0). Newer
  # nixpkgs-unstable ships 3.28.0, which haskell.nix hasn't materialized yet,
  # forcing an IFD (import-from-derivation) rebuild of spdx-json on every
  # package build.
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix/adb6e0b1e01d97eadf5ede3c5c7bdbd5ab211e64";
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
      # aarch64-linux is excluded: `nix flake check` realises hydraJobs
      # derivations (e.g. GHC) for every listed system, which needs a
      # registered builder for that foreign system that plain CI runners
      # don't have.
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
  };
}
