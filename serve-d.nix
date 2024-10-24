with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "serve-d";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/Pure-D/serve-d/releases/download/v0.7.6/serve-d_0.7.6-linux-x86_64.tar.gz";
    sha256 = "sha256-vkGkP0VFtXvzHKvs/p8buS7ed4Vl51tyuySeGd2sI8A=";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    tar -xzf $src
    cp serve-d $out/bin
    chmod +x $out/bin/serve-d
   '';
}
