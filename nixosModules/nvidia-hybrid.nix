{ pkgs, lib, config, ... }: {

  options = {
    nvidia-hybrid.enable =
      lib.mkEnableOption "Enable nvidia-hybrid";
  };

  config = lib.mkIf config.nvidia-hybrid.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };

    hardware.nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
  };

}
