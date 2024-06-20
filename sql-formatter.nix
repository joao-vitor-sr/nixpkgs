with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "pretty-php";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/lkrms/pretty-php/releases/download/v0.4.64/pretty-php.phar";
    sha256 = "sha256-VlI6pWAf1j7+2BXJ+dUXhBt5Lfy+sj3g0c3xvuFDaGk=";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/pretty-php
    chmod +x $out/bin/pretty-php
  '';
}
