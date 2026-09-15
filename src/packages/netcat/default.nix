{ pkgs, ... }: {
  home.packages = [
    pkgs.netcat-openbsd
  ];
}