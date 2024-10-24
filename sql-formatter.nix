with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "sql-formatter";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/sql-formatter-org/sql-formatter/archive/refs/tags/v15.3.2.zip";
    sha256 = "sha256-RATI0Hep1t/+ld/lJw278a47I1/TsdcOHl4OvJ/IY+Y=";
  };

  nativeBuildInputs = [ unzip ];
  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    unzip $src
    cp sql-formatter-15.3.2/bin/sql-formatter-cli.cjs $out/bin/sql-formatter
    chmod +x $out/bin/sql-formatter
  '';
}
