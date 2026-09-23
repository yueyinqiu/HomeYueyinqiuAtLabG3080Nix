{ pkgs, lib, ... }: {
  programs.bash.enable = true;
  programs.bash.initExtra = lib.mkBefore ''
    . /etc/bash.bashrc
    PROMPT_COMMAND=("history -a" "''${PROMPT_COMMAND[@]}")
  '';

  home.packages = [
    (pkgs.writeShellApplication {
      name = "my-bash-escape-std";
      text = ''
        input=$(cat)
        printf "%s" "''${input@Q}"
      '';
    })
  ];

  imports = [
    ./cheats.nix
  ];
}
