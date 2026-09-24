{ pkgs, ... }:
{
  home-manager-vscode-server-machine-settings = {
    enable = true;
    mutable = true;
    settings = {
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "${pkgs.nixfmt}/bin/nixfmt" ];
          };
        };
      };
    };
  };
}
