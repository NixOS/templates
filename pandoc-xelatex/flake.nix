{
  description = "A report built with Pandoc, XeLaTex and a custom font";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.report = (
        let pkgs = nixpkgs.legacyPackages.x86_64-linux;
            fonts = pkgs.makeFontsConf { fontDirectories = [ pkgs.dejavu_fonts ]; };
        in
          pkgs.stdenv.mkDerivation {
              name = "XelatexReport";
              src = [ ./report.md ];
              buildInputs = with pkgs; [ pandoc texlive.combined.scheme-small ];
              phases = ["unpackPhase" "buildPhase"];
              unpackPhase = ''
              for srcFile in $src; do
                cp $srcFile $(stripHash $srcFile)
              done
              '';
              buildPhase = ''
              export FONTCONFIG_FILE=${fonts}
              mkdir -p $out
              pandoc report.md --pdf-engine=xelatex -o $out/report.pdf
              '';
          }
        );

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.report;

  };
}
