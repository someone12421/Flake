{ pkgs, lib, config, inputs, ... }: {

  options = {
    spicetify.enable =
    lib.mkEnableOption "Enable Spicetify";
  };


  config = lib.mkIf config.spicetify.enable{
    programs.spicetify = 
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;

      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
      ];
    };
  };

}
