with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "hyprpicker";
  version = "latest";

  src = pkgs.fetchurl {
    url =
      "https://github.com/hyprwm/hyprpicker/releases/download/v0.3.0/v0.3.0.tar.gz";
    sha256 = "sha256-IblO9XPUqQypj5H1nD/w2UzhpK8I6m3xBUID7p74cUo=";
  };

  phases = [ "installPhase" "patchPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    tar -xzf $src
    cp hyprpicker/* $out/bin
    chmod +x $out/bin/hyprpicker
  '';
}
