{ pkgs, lib, config, ... }: {

  options = {
    battery-threshold.enable =
      lib.mkEnableOption "Set the battery charge threshold to 80%";
  };

  config = lib.mkIf config.battery-threshold.enable {
    systemd.services.battery-threshold = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      after = [ "multi-user.target" ];
      startLimitBurst = 0;
      description = "Set the battery charge threshold to 80%";
      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
        ExecStart = "${pkgs.bash}/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
      };
    };
  };

}