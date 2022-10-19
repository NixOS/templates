{ lib
, stdenv
  # , fetchurl
  # , fetchFromGitHub
  # , fetchFromGitLab
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "mypackage";
  version = "1.0.0";

  # src = fetchurl {
  #   url = "https://";
  #   hash = lib.fakeHash;
  # };

  # src = fetchFromGitHub {
  #   owner = "owner";
  #   repo = pname;
  #   rev = "v${version}";
  #   hash = lib.fakeHash;
  # };

  # src = fetchFromGitLab {
  #   domain = "";
  #   owner = "";
  #   repo = pname;
  #   rev = "v${version}";
  #   hash = lib.fakeHash;
  # };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
  ];

  meta = with lib; {
    homepage = "https://";
    description = "";
    maintainers = with maintainers; [  ];

    # license = licenses.mit;
    # license = licenses.gpl3;
    # license = licenses.free;
    # license = licenses.gpl2;
    # license = licenses.gpl2Plus;
    # license = licenses.gpl3Plus;
    # license = licenses.asl20;
    # license = licenses.bsd3;

    # platforms = platforms.linux;
    # platforms = platforms.unix;
    # platforms = platforms.all;
  };
}
