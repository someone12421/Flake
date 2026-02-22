{ pkgs, lib, ... }: {

  imports =
    [
      ./zsh
      ./kitty.nix
      ./temps.nix
      ./niri.nix
      ./spicetify.nix
    ];
    
    spicetify.enable =
      lib.mkDefault true;

}
