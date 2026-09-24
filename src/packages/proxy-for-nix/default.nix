{ ... }:
{
  home-manager-mihomo-manager.instances.for-nix = {
    port = 57764;
    configuration = ./proxy;
  };
}
