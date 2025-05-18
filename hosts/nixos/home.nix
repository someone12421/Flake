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

    programs.git = {
    enable = true;
    userName  = "Someone12421";
    userEmail = "randomguy145@protonmail.com";
  };


  home.packages = [
    # Packages
    pkgs.vesktop
    pkgs.fastfetch
    pkgs.vscode

    # Fonts
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
