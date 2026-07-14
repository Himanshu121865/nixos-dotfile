{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    unzip
    zip
    btop
    nvtopPackages.intel
    fastfetch
    github-cli
  ];
}
