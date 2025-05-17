{ pkgs, lib, config, ... }: {

  options = {
    steam.enable =
      lib.mkEnableOption "Enable Steam";
    };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
    ];

    programs.gamemode.enable = true;
  };

}
