{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./fonts.nix
    ./nvim
  ];
  users.users.matt = {
    name = "matt";
    home = "/Users/matt";
  };
  home-manager.users.matt = {
    home.shellAliases = {
      ":q" = "exit";
      "ls" = "lsd";
      "la" = "lsd -a";
      "ll" = "lsd -l";
      "lt" = "lsd --tree";
      "lla" ="lsd -la";
      "llt" ="lsd -l --tree";
      "llat" ="lsd -la --tree";
    };
    home.stateVersion = "24.11";

    programs = {
      bat.enable = true;
      lsd.enable = true;
      fzf.enable = true;
      fd.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      htop.enable = true;
      git = {
        enable = true;
        userName = "MattRStoffel";
        userEmail = "Matt@MrStoffel.com";
      };
      zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}

