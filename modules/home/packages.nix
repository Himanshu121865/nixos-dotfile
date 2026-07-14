{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    mpv
    yazi
    proton-vpn
  ];
}
