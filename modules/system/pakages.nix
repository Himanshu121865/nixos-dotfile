{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    kitty
    telegram-desktop
    neovim
    git
    opencode
    wget
    wallust
    waybar
    awww
  ];
}
