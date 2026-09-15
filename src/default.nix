{ ... }: {
  home.username = "yueyinqiu";
  home.homeDirectory = "/home/yueyinqiu";

  programs.home-manager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  imports = [ ./packages ];

  home.stateVersion = "26.05";
}
