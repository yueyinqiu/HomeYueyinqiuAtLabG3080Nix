{ vscode-server, ... }: {
  imports = [
    vscode-server.homeModules.default
  ];
          
  services.vscode-server.enable = true;
  services.vscode-server.enableFHS = true;
  services.vscode-server.extraRuntimeDependencies = pkgs: with pkgs; [
    nixd
  ];
}