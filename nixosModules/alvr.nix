{ pkgs, lib, config, ... }: {

  options = {
    alvr.enable =
      lib.mkEnableOption "Enable ALVR";
    };

  config = lib.mkIf config.alvr.enable {
    programs.alvr = {
      enable = true;
      openFirewall = true;
    };
  };

}
