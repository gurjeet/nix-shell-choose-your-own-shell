with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "some_name";
  buildInputs = [
    which
    bashInteractive_5
  ];

  shellHook = ''
# Strip the first element from $PATH. This component was prepended by nix-shell
# to make sure the bash in caller's environment gets used inside nix-shell
# environment as well.
export PATH="$(echo "$PATH" | cut -d : -f 2-)"

# Now invoke first bash found in $PATH. Use --norc to prevent invoking user's ~/.bashrc
exec env PS1='$ ' bash --norc

# Any code after the exec command above will not be executed
  '';
}

