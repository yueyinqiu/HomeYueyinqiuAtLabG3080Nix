{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    mihomo-manager with for-nix home-manager switch --flake . --extra-experimental-features 'nix-command flakes'
  '';
}
