with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "texlab";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/latex-lsp/texlab/releases/download/v5.16.1/texlab-x86_64-linux.tar.gz";
    sha256 = "sha256-S/cp0iUKpt5D+J14KCTkzIdSCe/KHkMwFmVCSBw83o8=";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    tar -xzf $src
    cp texlab $out/bin/texlab
    chmod +x $out/bin/texlab
  '';
}
