with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "nvim";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz";
    sha256 = "be1f0988d0de71c375982b87b86cd28d2bab35ece8285abe3b0aac57604dfc5a";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    tar -xzf $src
    cp nvim-linux64/bin/nvim $out/bin/nvim
    chmod +x $out/bin/nvim
  '';
}
