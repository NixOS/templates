{
  description = "A report built with Pandoc, XeLaTex and a custom font";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.report = (
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            fonts = pkgs.makeFontsConf { fontDirectories = [ pkgs.dejavu_fonts ]; };
        in
          pkgs.stdenv.mkDerivation {
              name = "XelatexReport";
              src = ./.;
              buildInputs = with pkgs; [
                  pandoc
                  haskellPackages.pandoc-crossref
                  texlive.combined.scheme-small
                  ];
              phases = ["unpackPhase" "buildPhase"];
              buildPhase = ''
              export FONTCONFIG_FILE=${fonts}
              mkdir -p $out
              pandoc README.md --filter pandoc-crossref --citeproc --pdf-engine=xelatex -o $out/README.pdf
              '';
          }
        );

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.report;
  };
}
