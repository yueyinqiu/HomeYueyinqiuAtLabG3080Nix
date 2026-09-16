{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nix-airgap = {
      url = "github:bitbloxhub/nix-airgap";
    };
  };

  outputs = inputs: {
    homeConfigurations."yueyinqiu@lab-g3080-nix" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        nur = inputs.nur.legacyPackages."x86_64-linux".repos;
      };
      modules = [
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
