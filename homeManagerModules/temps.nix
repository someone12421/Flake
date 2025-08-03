{ pkgs, lib, config, ... }: {

  options = {
    temps.enable =
    lib.mkEnableOption "Enable Temperature Script";
  };

  config = lib.mkIf config.temps.enable{
    home.packages = [
      (pkgs.writeShellScriptBin "temps" ''watch -t temps-print'')

      (pkgs.writeShellScriptBin "temps-print" ''
        echo "GPU Current Temp"
        echo "Core 0:       +$(( $((`nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader`)) ))°C"
        # nvidia-smi --query --display=TEMPERATURE | grep "GPU Current Temp" --color=none | sed 's/        //g'

        echo ""

        echo "CPU Current Temp"
        sensors coretemp-isa-0000 | sed 's/(high.*//g' | tail -n +4 | sed 's/\.[0-9]//g'

        echo "Fans Current speed"
        sensors asus-isa-000a | sed 's/(high.*//g' | tail -n +3 | sed 's/\.[0-9]//g'
      '')
    ];
  };

}