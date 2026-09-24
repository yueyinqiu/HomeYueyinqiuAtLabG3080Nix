{
  ...
}:
{
  programs.bash.bashrcExtra = ''
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
  '';

  imports = [
    ./cheats.nix
  ];
}
