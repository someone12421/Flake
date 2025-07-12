{ pkgs, lib, config, ... }: {


  programs.kitty = {
    enable = true;
    #themeFile = "GruvboxMaterialDarkHard";
    #font.name = "JetBrainsMono Nerd Font";
    settings = {
      confirm_os_window_close = 0;
      #background_opacity = "0.5";
      background_blur = 5;
    };
  };

}