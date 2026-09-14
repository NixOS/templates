{
  pkgs = hackage: {
    packages = {
      ghc-bignum.revision = hackage.ghc-bignum."1.3".revisions.default;
      base.revision = hackage.base."4.18.3.0".revisions.default;
      ghc-prim.revision = hackage.ghc-prim."0.10.0".revisions.default;
    };
    compiler = {
      version = "9.6.7";
      nix-name = "ghc967";
      packages = {
        "ghc-prim" = "0.10.0";
        "ghc-bignum" = "1.3";
        "base" = "4.18.3.0";
      };
    };
  };
  extras = hackage: {
    packages = {
      hello = ./.plan.nix/hello.nix;
    };
  };
  modules = [
    {
      preExistingPkgs = [
        "ghc-bignum"
        "base"
        "ghc-prim"
      ];
    }
    (
      { lib, ... }:
      {
        packages = {
          "hello" = {
            flags = {
              "threaded" = lib.mkOverride 900 false;
            };
          };
        };
      }
    )
    (
      { lib, ... }:
      {
        packages = {
          "hello".components.exes."hello".planned = lib.mkOverride 900 true;
          "ghc-bignum".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
        };
      }
    )
  ];
}
