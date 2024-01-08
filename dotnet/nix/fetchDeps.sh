#!/bin/bash

# This file was adapted from
# https://github.com/NixOS/nixpkgs/blob/b981d811453ab84fb3ea593a9b33b960f1ab9147/pkgs/build-support/dotnet/build-dotnet-module/default.nix#L173
set -euo pipefail
export PATH="@binPath@"
for arg in "$@"; do
    case "$arg" in
        --keep-sources|-k)
            keepSources=1
            shift
            ;;
        --help|-h)
            echo "usage: $0 [--keep-sources] [--help] <output path>"
            echo "    <output path>   The path to write the lockfile to. A temporary file is used if this is not set"
            echo "    --keep-sources  Don't remove temporary directories upon exit; useful for debugging"
            echo "    --help          Show this help message"
            exit
            ;;
    esac
done
tmp=$(mktemp -td "@pname@-tmp-XXXXXX")
export tmp
HOME=$tmp/home
exitTrap() {
    test -n "${ranTrap-}" && return
    ranTrap=1
    if test -n "${keepSources-}"; then
        echo -e "Path to the source: $tmp/src\nPath to the fake home: $tmp/home"
    else
        rm -rf "$tmp"
    fi
    # Since mktemp is used this will be empty if the script didn't successfully complete
    if ! test -s "$depsFile"; then
      rm -rf "$depsFile"
    fi
}
trap exitTrap EXIT INT TERM
dotnetRestore() {
    local -r project="${1-}"
    local -r rid="$2"
    dotnet restore "${project-}" \
        -p:ContinuousIntegrationBuild=true \
        -p:Deterministic=true \
        --packages "$tmp/nuget_pkgs" \
        --runtime "$rid" \
        --no-cache \
        --force
}
declare -a projectFiles=( @projectFiles@ )
declare -a testProjectFiles=( @testProjectFiles@ )
export DOTNET_NOLOGO=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
depsFile=$(realpath "${1:-$(mktemp -t "@pname@-deps-XXXXXX.nix")}")
mkdir -p "$tmp/nuget_pkgs"
storeSrc="@storeSrc@"
src="$tmp/src"
cp -rT "$storeSrc" "$src"
chmod -R +w "$src"
cd "$src"
echo "Restoring project..."
rids=("@rids@")
for rid in "${rids[@]}"; do
    (( ${#projectFiles[@]} == 0 )) && dotnetRestore "" "$rid"
    for project in "${projectFiles[@]-}" "${testProjectFiles[@]-}"; do
        dotnetRestore "$project" "$rid"
    done
done
echo "Successfully restored project"
echo "Writing lockfile..."
echo -e "# This file was automatically generated.\n# Please don't edit it manually; your changes might get overwritten!\n" > "$depsFile"
nuget-to-nix "$tmp/nuget_pkgs" "@packages@" >> "$depsFile"
echo "Successfully wrote lockfile to $depsFile"
