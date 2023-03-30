{
  # inspired by: https://serokell.io/blog/practical-nix-flakes#packaging-existing-applications
  description = "A Hello World in Haskell with a dependency and a devShell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib;
    let
      supportedSystems = with system; [ x86_64-linux ];
    in
    {
      overlay = (final: prev: {
        haskell-hello = final.haskellPackages.callCabal2nix "haskell-hello" ./. { };
      });
    }
    // eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs
          {
            inherit system;
            overlays = [ self.overlay ];
          };
      in
      {
        packages = {
          haskell-hello = pkgs.haskell-hello;
          default = pkgs.haskell-hello;
        };
        devShell =
          let haskellPackages = pkgs.haskellPackages;
          in
          haskellPackages.shellFor {
            packages = p: [ pkgs.haskell-hello ];
            buildInputs = with haskellPackages; [
              haskell-language-server
              stack
            ];
            # Change the prompt to show that you are in a devShell
            shellHook = "export PS1='\\e[1;34mdev > \\e[0m'";
          };
      });
}
