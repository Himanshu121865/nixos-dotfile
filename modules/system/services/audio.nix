{ pkgs, ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/main.lua.d/51-disable-suspend.lua" ''
      rule = {
        matches = {
          {
            { "device.name", "matches", "alsa_*" },
          },
        },
        apply_properties = {
          ["session.suspend-timeout-seconds"] = 0,
        },
      }
      table.insert(bluez_monitor.rules, rule)
    '')
  ];
}
