{ ... }:
{
  home-manager-vscode-server-machine-settings = {
    enable = true;
    mutable = true;
  };

  imports = [
    ./languages
  ];
}
