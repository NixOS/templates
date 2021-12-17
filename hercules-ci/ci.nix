if builtins?getFlake
then (builtins.getFlake (toString ./.)).ciNix
else (import ./flake-compat.nix).defaultNix.ciNix
