{ ... }: {
  programs.home-manager-mihomo-manager.instances.to-overseas = {
    port = 38816;
    configuration = ./config;
  };
}
