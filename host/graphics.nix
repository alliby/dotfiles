{  pkgs, ... }:
{
  # Opengl
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      libva
      vaapiIntel
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" "nvidiaLegacy390" "nvidiaLegacy340" ];
  environment.systemPackages = with pkgs; [ 
    vulkan-loader
    vulkan-headers
    vulkan-tools
    vulkan-validation-layers
    spirv-tools  
    libva-utils
    linux-firmware
  ];

  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.modesetting.enable = true;

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";
    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:6:0:0";
  };

}
