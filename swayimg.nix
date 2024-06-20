with import <nixpkgs> { };

stdenv.mkDerivation rec {
 pname = "swayimg";
  version = "v2.2";

  src = fetchFromGitHub {
    owner = "artemsen";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-UwIufR3EwbpNVHD1GypV3qNgiqDRllwtxAM0CZPodn0=";
  };

  depsBuildBuild = [
    pkg-config
  ];

  nativeBuildInputs = [ meson ninja pkg-config wayland-scanner ];

  buildInputs = [
    bash-completion
    wayland
    wayland-protocols
    json_c
    libxkbcommon
    fontconfig
    giflib
    libheif
    libjpeg
    libtiff
    librsvg
    libpng
    libjxl
    libexif
    libwebp
  ];

  NIX_CFLAGS_LINK = [ "-lwebp" ];
}
