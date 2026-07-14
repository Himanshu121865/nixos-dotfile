{ pkgs, ... }: {
  home.packages = with pkgs; [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        obs-pipewire-audio-capture
      ];
    })
  ];
}
