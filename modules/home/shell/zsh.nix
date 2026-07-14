{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    completionInit = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*' completer _expand _complete _ignores _correct _approximate
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    '';

    shellAliases = {
      ll = "eza -l";
      la = "eza -la";
      tree = "eza --tree";
      cat = "bat";
      edit = "sudo -e";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#ark";
      update = "nix flake update";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [
      "rm *"
      "pkill *"
      "cp *"
    ];

    initContent = "fastfetch";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    eza
    bat
    zoxide
    fd
  ];
}
