{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/hardware/hardware.nix
    ./modules/system/services/services.nix
    ./modules/system/fonts.nix
    ./modules/system/pakages.nix
    ./modules/system/display/display.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];
  networking.firewall.checkReversePath = false;
  networking.hostName = "ark";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };

  users.users.ark = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "hello";
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = "26.05";
}
