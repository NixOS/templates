{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import (inputs.nixpkgs) {
          config = {allowUnfree = true;};
          inherit system;
        });
                  
        extensions = (with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ]);

        vscodium-with-extensions = pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscodium;
          vscodeExtensions = extensions;
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs=[
            vscodium-with-extensions
            pkgs.nodePackages.pnpm
            pkgs.nodePackages.typescript
            pkgs.nodePackages.typescript-language-server
          ];
        };
      }
    );
}
