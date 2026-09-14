{
  name = "bevy";
  description = "A flake for setting up a dev environment for Bevy game engine";
  inputs = {
    naersk.url = "github:nmattia/naersk/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, naersk }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        naersk-lib = pkgs.callPackage naersk { };
      in {

        defaultPackage = naersk-lib.buildPackage ./.;

        defaultApp = utils.lib.mkApp { drv = self.defaultPackage."${system}"; };

        #REF https://github.com/bevyengine/bevy/blob/main/docs/linux_dependencies.md#nixos
        devShell = with pkgs;
          mkShell {
            nativeBuildInputs = [ pkgconfig clang lld ];
            buildInputs = [
              cargo
              rustc
              rustfmt
              rustPackages.clippy
              alsa-lib
              udev
              vulkan-loader
              xorg.libX11
              x11
              xorg.libXrandr
              xorg.libXcursor
              xorg.libXi
            ];
            shellHook = ''
              export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${
                pkgs.lib.makeLibraryPath [ udev alsaLib vulkan-loader ]
              }"'';
            RUST_SRC_PATH = rustPlatform.rustLibSrc;
          };
      });
}
