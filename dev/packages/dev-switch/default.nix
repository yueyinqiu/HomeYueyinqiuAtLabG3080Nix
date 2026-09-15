{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    home-manager switch --flake . --extra-experimental-features 'nix-command flakes'
  '';
}
