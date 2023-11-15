{
  programs.nushell.shellAliases = {
    l   = "ls";
    la  = "ls -a";
    lt = "exa -l --tree";
    c   = "clear";
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";
    v = "hx";
    sx = "sxiv";
    gc = "git clone";
    sudo = "doas";
  };
}
