{ pkgs, lib, ... }: {

  imports =
    [
      ./zsh
      ./kitty.nix
      ./temps.nix
    ];
    
    kitty.enable =
      lib.mkDefault true;

}
