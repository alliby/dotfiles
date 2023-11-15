{ ... }: {
  # Bash
  imports = [ ./aliases.nix ];
  programs.bash.enable = true;
  programs.bash = {
    historyFileSize = 1000;
    historyIgnore = [ "exit" "clear" "c" "cd" "ll" "poweroff" "reboot" "ls" "history" ];
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
  };
}

