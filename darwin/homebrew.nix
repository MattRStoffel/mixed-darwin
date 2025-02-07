{ config, pkgs, ... }:

{
  # Homebrew needs to be installed on its own!
  homebrew = {
    enable = true;
    casks = [
      "alfred"
      "discord"
      "libreoffice"
      "firefox"
      "mac-mouse-fix"
      "rectangle"
      "ghostty"
      "obsidian"
      "nextcloud"
      "tailscale"
    ];
    masApps = {
      Xcode = 497799835;
    };

    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
  };
}
