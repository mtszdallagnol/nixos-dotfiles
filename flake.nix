{
	description = "System configuration flake";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix4nvchad = {
			url = "github:nix-community/nix4nvchad";
			inputs.nixpkgs.follows = "nixpkgs";
      
      inputs.nvchad-starter.url = "path:./config/nvim";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs =  { inherit inputs; };
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.mateus = import ./home;
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit inputs; };
					};
				}
			];
		};

    templates = {
      rust = {
        path = ./templates/rust;
        description = "Rust dev template"; 
      };
    };
	};
}
