{ config, ... }: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
  };
  systemd.user.services.nh-clean.path = [ "${config.home.homeDirectory}/.nix-profile/bin" ];
}