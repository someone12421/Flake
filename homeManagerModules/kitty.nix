{ pkgs, lib, config, ... }: {

  options = {
    kitty.enable = 
      lib.mkEnableOption "Enable Kitty";
    };

  config = lib.mkIf config.kitty.enable{
    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      font.name = "JetBrainsMono Nerd Font";
      settings = {
        confirm_os_window_close = 0;
        background_opacity = "0.5";
        background_blur = 5;
      };
    };
  };

}