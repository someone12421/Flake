{ pkgs, lib, ... }: {

  imports =
    [
      ./nvidia-hybrid.nix
      ./steam.nix
      ./battery-threshold.nix
      ./alvr.nix
    ];

    steam.enable =
      lib.mkDefault true;

}
