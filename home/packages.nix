{
  pkgs,
  ...
}: {

  home.packages = with pkgs; [

    # System
    firefox # Firefox Browser
    xclip # X clipboard
    htop # An interactive process viewer
    eza # Replacement for 'ls' written in Rust
    neofetch # A fast, highly customizable system info script
    fd # A simple, fast and user-friendly alternative to find
    btop # A monitor of resources
    gruvbox-gtk-theme # Gtk Theme
    papirus-icon-theme # Papirus icon theme
    # alsa-utils # ALSA, the Advanced Linux Sound Architecture utils
    pavucontrol # PulseAudio Volume Control
    rsync # Fast incremental file transfer utility
    bluetuith
    networkmanagerapplet
    
    # Programming
    vscodium # Open source source code editor
    nodejs # the V8 JavaScript engine
    zig # Zig Programming language
    gcc
    
    # Media
    sxiv # Simple X Image Viewer
    aria2 # download utility

    # Graphics
    inkscape # Vector graphics editor
    gimp # The GNU Image Manipulation Program
    airshipper # Launcher Of Veleron
    # blender_3_6

    # Archive
    zip # Compressor/archiver for creating and modifying zipfiles
    unzip # An extraction utility for archives compressed in .zip format
    gzip # GNU zip compression program
    bzip2 # High-quality data compression program
    unrar # Utility for RAR archives
    p7zip # Add 7z archive

    # Tools
    # libreoffice # Office Suite
    gitui # Blazing fast terminal-ui for Git written in Rust
    translate-shell # Command-line translator using Google Translate, Bing Translator, Yandex.Translate, and Apertium
    # arduino # Open-source electronics prototyping platform
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    yt-dlp # command-line program to download videos from YouTube.com
    file # A program that shows the type of files
    fzf # Fuzzy Finder
    simplescreenrecorder # A screen recorder for Linux
    yazi
    ueberzugpp

    # Android
    scrcpy # Display and control Android devices over USB or TCP/IP
    android-file-transfer # Reliable MTP client with minimalistic UI

    # Social
    discord # All-in-one cross-platform voice and text chat for gamers
    tdesktop # Telegram Desktop messaging app
    
    # Wireless
    airgeddon # Multi-use TUI to audit wireless networks. 
    aircrack-ng # Wireless encryption cracking tools
    mdk4 # A tool that injects data into wireless networks
    hcxtools # Tools for capturing wlan traffic and conversion to hashcat and John the Ripper formats
    hashcat # Fast password cracker
    hashcat-utils # Small utilities that are useful in advanced password cracking

  ];
}
