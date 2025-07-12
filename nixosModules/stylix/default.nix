{ pkgs, ... }: {

  stylix = {
    enable = true;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    polarity = "dark";

    image = ./plasma6-scarlet-tree.png;



    opacity = {
      applications = 1.0;
      terminal = 0.5;
      desktop = 1.0;
      popups = 1.0;
    };


    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
       name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
     };
    };

    fonts.sizes = {
      applications = 10;
      terminal = 11;
      desktop = 10;
      popups = 10;
    };
   };

#  home-manager.sharedModules = [
#    {
#      stylix.targets = {
#        kitty.enable = false;
#      };
#    }
#  ];


}