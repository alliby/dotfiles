{
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Networking
  networking = {
    hostName = "nix"; # Define your hostname.
    nameservers = ["1.1.1.1" "8.8.8.8"]; # Change Dns Resolver
    usePredictableInterfaceNames = false;
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
    networkmanager.wifi.powersave = true;
  };
  systemd.services.NetworkManager-wait-online.enable = false; # slows down boot time

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm pkgs.nano ];

    # Tiling Windows Manager
    windowManager.bspwm.enable = true;
    windowManager.i3.enable = true;
    windowManager.awesome.enable = true;

    # Configure keymap in X11
    layout = "us,ara";
    # See Full Keyboard Layout Keybinds "grep "grp:.*toggle" /usr/share/X11/xkb/rules/base.lst"
    xkbOptions = "grp:alt_shift_toggle";

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    libinput.touchpad.naturalScrolling = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cargo = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "render" "bluetooth" "dialout"];
  };

  # Disable sudo
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = ["cargo"];
      keepEnv = true;
      persist = true;
    }
  ];

  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.displayManager.lightdm = {   
    extraSeatDefaults = ''
         autologin-user=cargo
         autologin-user-timeout=0
    '';
  };
}
