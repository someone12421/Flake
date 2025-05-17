{ pkgs, lib, config, ... }: {

  options = {
    zsh.enable =
      lib.mkEnableOption "Enable Zsh";
    };

  config = lib.mkIf config.zsh.enable{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent = lib.mkBefore "
        fastfetch
        zstyle ':completion:*' list-colors ''
        zstyle ':completion:*:commands' list-colors '=*=1;38;5;5'
        zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
        zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
        zstyle ':completion:*' menu select=1
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
      ";
      
      shellAliases = {
        vim = "nvim";
        update = "cd ~/Flake && nix flake update && cd -";
        rebuild = "sudo nixos-rebuild switch --flake ~/Flake";
      };

      history.size = 1000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
    };
    programs.starship = let
      getPreset = name: (with builtins; removeAttrs (fromTOML (readFile "${pkgs.starship}/share/starship/presets/${name}.toml")) ["\"$schema\""]);
      in {
        enable = true;
        enableZshIntegration = true;

        settings = 
        lib.recursiveUpdate
          (lib.mergeAttrsList [
            #(getPreset "nerd-font-symbols")
            (getPreset "catppuccin-powerline")
        ]) {};
     };
    };

}
