{
  inputs.poetry2nix.url = "github:nix-community/poetry2nix";
  # Follow poetry2nix's own tested nixpkgs, rather than an independently
  # floating one, to avoid nixpkgs.lib.licenses changes poetry2nix hasn't
  # caught up with yet (e.g. composite license combinators as functions).
  inputs.nixpkgs.follows = "poetry2nix/nixpkgs";

  outputs =
    {
      self,
      nixpkgs,
      poetry2nix,
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgs = forAllSystems (system: nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (
        system:
        let
          inherit (poetry2nix.lib.mkPoetry2Nix { pkgs = pkgs.${system}; }) mkPoetryApplication;
        in
        {
          default = mkPoetryApplication { projectDir = self; };
        }
      );

      devShells = forAllSystems (
        system:
        let
          inherit (poetry2nix.lib.mkPoetry2Nix { pkgs = pkgs.${system}; }) mkPoetryEnv;
        in
        {
          default = pkgs.${system}.mkShellNoCC {
            packages = with pkgs.${system}; [
              (mkPoetryEnv { projectDir = self; })
              poetry
            ];
          };
        }
      );
    };
}
