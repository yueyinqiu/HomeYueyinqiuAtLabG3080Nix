{ nur, ... }:
{
  home.packages = [
    nur.yueyinqiu.nix-daemon-proxy-client
  ];

  programs.home-manager-mihomo-manager.instances.for-nix-daemon = {
    port = 57764;
    configuration = ./proxy;
  };
}
