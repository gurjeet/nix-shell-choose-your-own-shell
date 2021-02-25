with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "some_name";
  buildInputs = [
    coreutils
    which
    bashInteractive_5
  ];
}

