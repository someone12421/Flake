{ pkgs, lib, ... }: {


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "
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

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    history.size = 1000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
  };
  
}
