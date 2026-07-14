{ ... }: {
  imports = [
    ./modules/home/symlinks.nix
    ./modules/home/shell/shell.nix
    ./modules/home/packages.nix
    ./modules/home/wallust.nix
    ./modules/home/dev/dev.nix
    ./modules/home/obs.nix
  ];
  home.username = "ark";
  home.homeDirectory = "/home/ark";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
