{
  name,
  pkgs,
  nix-airgap,
  ...
}:

let
  installable = ".#homeConfigurations.\"yueyinqiu@lab-g3080-nix\".activationPackage";
  remoteHost = "lab-g3080-nix";
  remoteOutLink = "/home/yueyinqiu/.cache/home-manager-remote-switch/result";
in
pkgs.writeShellApplication {
  name = name;
  text = ''
    "${nix-airgap.airgap}/bin/nix-airgap" \
      "${installable}" \
      "${remoteHost}" \
      --remote-out-link "${remoteOutLink}"

    ssh "${remoteHost}" -- "${remoteOutLink}/activate"
  '';
}
