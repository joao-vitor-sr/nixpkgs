with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "php-cs-fixer";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v3.57.2/php-cs-fixer.phar";
    sha256 = "sha256-bBUBfYO+1Jpi8dkAD6cD5Hnvl9yAuJYSDoQx+Gp4WlA=";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/php-cs-fixer
    chmod +x $out/bin/php-cs-fixer
  '';
}
