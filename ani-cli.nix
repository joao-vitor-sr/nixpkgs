with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "ani-cli";
  version = "latest";

  src = fetchFromGitHub {
    owner = "pystardust";
    repo = "ani-cli";
    rev = "v4.8";
    sha256 = "sha256-vntCiWaONndjU622c1BoCoASQxQf/i7yO0x+70OxzPU=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp ani-cli $out/bin/
  '';
}
