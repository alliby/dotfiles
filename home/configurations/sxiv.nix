{
  home.file.".config/sxiv/exec/key-handler" = {
    executable = true;
    text = ''
    #!/bin/sh
    while read file
    do
            case "$1" in
            "d")
                    rm "$file" ;;
            "c")
                    echo -n "$file" | xclip -selection clipboard;;
            "w")
                    kabegami "$file" ;;
            esac
    done
  '';
  };
}
