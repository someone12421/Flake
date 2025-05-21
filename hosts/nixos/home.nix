{ config, pkgs, ... }:

{
  home.username = "someone12421";
  home.homeDirectory = "/home/someone12421";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  temps.enable = true;

  programs.vscode.enable = true;

  programs.git = {
    enable = true;
    userName  = "Someone12421";
    userEmail = "randomguy145@protonmail.com";
  };


  home.packages = [
    # Packages
    pkgs.vesktop
    pkgs.fastfetch

    # Fonts
    pkgs.nerd-fonts.jetbrains-mono
  ];

  home.file = {

  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
