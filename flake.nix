{
  description = "mixed.darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      environment = {
        # systemPath = [];
        variables = {
          EDITOR = "nvim";
        };
      };

      nix.settings.experimental-features = "nix-command flakes"; # Necessary for using flakes on this system.

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";

      # Set Git commit hash for darwin-version.
      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
  
        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 5;
      };

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ 
	configuration
	./darwin/default.nix	
	./home
        home-manager.darwinModules.home-manager
      ];
    };
  };
}
