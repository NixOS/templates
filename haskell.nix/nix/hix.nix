{ pkgs, ... }: {
  # name = "project-name";
  compiler-nix-name = "ghc96"; # Version of GHC to use
  # Use nixpkgs' prebuilt GHC instead of haskell.nix's own patched one.
  # haskell-nix.compiler.* builds GHC from source via hadrianProject, which
  # always needs IFD to evaluate regardless of GHC version or materialization
  # (confirmed on haskell.nix's own flake, independent of this project).
  ghcOverride = pkgs.buildPackages.haskell.compiler.ghc967;
  plan-sha256 = "08iq08cxmpmp7r29a79jsdp1nl8b42z208q4jmcbqjvjm1p8cfcw";
  materialized = ../materialized/plan.nix;

  crossPlatforms =
    p:
    # mingwW64 (Windows) is omitted: haskell.nix's materialized iserv-proxy
    # (needed for cross-compiled TemplateHaskell support) doesn't cover
    # ghc966/ghc967 yet, so it falls back to an unmaterialized IFD build.
    pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      p.musl64
    ];

  # Tools to include in the development shell
  shell.tools.cabal = "latest";
  # shell.tools.hlint = "latest";
  # shell.tools.haskell-language-server = "latest";
}
