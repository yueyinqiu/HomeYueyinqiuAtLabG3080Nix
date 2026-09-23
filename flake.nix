{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    nur.url = "github:nix-community/NUR";
    nix-airgap.url = "github:bitbloxhub/nix-airgap";
    snavi.url = "github:yueyinqiu/Snavi-Nix";
    home-manager-mihomo-manager.url = "github:MihomoManager/HomeManagerMihomoManager";
  };

  outputs = inputs: {
    homeConfigurations."yueyinqiu@lab-g3080-nix" =
      let
        system = "x86_64-linux";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          nur = inputs.nur.legacyPackages.${system}.repos;
          nix-airgap = inputs.nix-airgap.packages.${system};
        };
        modules = [
          inputs.home-manager-mihomo-manager.homeManagerModules.home-manager-mihomo-manager
          inputs.snavi.homeManagerModules.snavi
          inputs.home-manager-mihomo-manager.homeManagerModules.home-manager-mihomo-manager
          ./src
        ];
      };
    devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (system: {
      default = import ./dev {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        nix-airgap = inputs.nix-airgap.packages.${system};
      };
    });
  };
}
