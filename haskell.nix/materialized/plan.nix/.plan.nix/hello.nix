{
  system,
  compiler,
  flags,
  pkgs,
  hsPkgs,
  pkgconfPkgs,
  errorHandler,
  config,
  ...
}:
{
  flags = {
    threaded = false;
  };
  package = {
    specVersion = "1.6";
    identifier = {
      name = "hello";
      version = "1.0.0.2";
    };
    license = "BSD-3-Clause";
    copyright = "(c) Simon Marlow";
    maintainer = "Simon Marlow <marlowsd@gmail.com>";
    author = "Simon Marlow";
    homepage = "http://www.haskell.org/hello/";
    url = "";
    synopsis = "Hello World, an example package";
    description = "This is an implementation of the classic \"Hello World\" program in\nHaskell, as an example of how to create a minimal Haskell\napplication using Cabal and Hackage.  Please submit any suggestions and\nimprovements.";
    buildType = "Simple";
    isLocal = true;
    detailLevel = "FullDetails";
    licenseFiles = [ "LICENSE" ];
    dataDir = ".";
    dataFiles = [ ];
    extraSrcFiles = [ ];
    extraTmpFiles = [ ];
    extraDocFiles = [ ];
  };
  components = {
    exes = {
      "hello" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        hsSourceDirs = [ "src" ];
        mainPath = [ "hello.hs" ] ++ pkgs.lib.optional (flags.threaded) "";
      };
    };
  };
}
// rec {
  src = pkgs.lib.mkDefault ../.;
}
