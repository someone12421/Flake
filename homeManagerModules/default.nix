{ pkgs, lib, ... }: {

  imports =
    [
      ./zsh.nix
      ./kitty.nix
      ./temps.nix
    ];

    zsh.enable =
      lib.mkDefault true;
    
    kitty.enable =
      lib.mkDefault true;

}
