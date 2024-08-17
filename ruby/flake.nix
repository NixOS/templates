{
  # Based on https://github.com/bobvanderlinden/templates/blob/master/ruby/flake.nix
  # Useage: see README.md
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
};

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        r10k = pkgs.bundlerEnv {
          name = "gemset";
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };
      in {

      defaultPackage = r10k;

      # used by nix shell and nix develop
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            ruby
            bundix
          ];
      };
  });
}
