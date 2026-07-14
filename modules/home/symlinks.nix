{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-config/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    nvim = "nvim";
    starship = "starship.toml";
    kitty = "kitty";
    fastfetch = "fastfetch";
    waybar = "waybar";
  };
in
{
  xdg.configFile = (
    builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    }) configs
  );
}
