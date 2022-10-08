{
  description = "Example haskell package with library, executable and tests";
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlay = (final: prev: {
          inherit example-package;
        });
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
        example-package = pkgs.haskellPackages.callCabal2nix "example-package" ./. {};
      in
      {
        packages = { inherit example-package; };
        defaultPackage = example-package;
        devShell = pkgs.haskellPackages.shellFor {
            name = "example-package";
            packages = p: [ example-package ];
            withHoogle = true;
            buildInputs = with pkgs; with pkgs.haskellPackages; [
              haskell-language-server
              ghcid
              cabal-install
              hpack
            ];
          shellHook = "command -v fish &> /dev/null && fish";
          };
       }
    );
}
