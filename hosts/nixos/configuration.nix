
{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Zsh
  programs.zsh.enable = true;

  # Set the battery charge threshold to 80%
  battery-threshold.enable = true;

  # Enable QMK 
  hardware.keyboard.qmk.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jerusalem";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IL";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable ADB
  programs.adb.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.someone12421 = {
    isNormalUser = true;
    description = "Someone12421";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Enable home manager
  home-manager = {
  extraSpecialArgs = {inherit inputs;};
  users = {
    "someone12421" = {
        imports = [
          ./home.nix
          inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
  };

  # Enable Flatpak
  services.flatpak.enable = true;

  #Enable NVIDIA PRIME
  nvidia-hybrid.enable = true;

  #Enable ALVR
  alvr.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "someone12421";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable AppImages
  programs.appimage.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    #CLI Utils
    neovim
    wget
    git
    lm_sensors
    qmk
    btrfs-progs

    #Desktop Apps
    kitty
    floorp
    #pixelflasher
    bottles
    gparted

    #Misc.
    nixfmt-rfc-style

  ];

  # Enable OBS
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
     droidcam-obs
     wlrobs
     obs-pipewire-audio-capture
     obs-vaapi
     obs-gstreamer
    ];
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
