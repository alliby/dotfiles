{
  lib,
  pkgs,
  ...
}: {
  programs.helix.enable = true;
  programs.helix.settings = {
    # Theme
    theme = "catppuccin_mocha_transparent";

    # Editor
    editor = {
      color-modes = true;
      cursorline = true;
      soft-wrap.enable = true;
      bufferline = "multiple";
      cursor-shape = {
        insert = "bar";
        normal = "block";
      };
      lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };
      statusline = {
        separator = "";
        left = ["mode" "selections" "spinner" "file-name" "total-line-numbers"];
        center = [];
        right = ["diagnostics" "file-encoding" "file-type" "position-percentage" "position"];
        mode = {
          normal = "NORMAL";
          insert = "INSERT";
          select = "SELECT";
        };
      };
    };

    # Keys
    keys.normal = {
      C-s = ":w";
      "{" = "goto_prev_paragraph";
      "}" = "goto_next_paragraph";
      "X" = "extend_line_above";
      space = {
        q = ":q";
        x = ":bc";
      };
    };
  };

  programs.helix.themes = {
    catppuccin_mocha_transparent = {
      "inherits" = "catppuccin_mocha";
      "ui.virtual.inlay-hint" = {
        fg = "surface1";
        modifiers = ["italic"];
      };
      "ui.background" = "{}";
    };
  };

  programs.helix.languages = {
    languages = [
      {
        name = "nix";
        language-server.command = "${pkgs.nil}/bin/nil";
        auto-format = true;
        formatter = {
          command = lib.getExe pkgs.alejandra;
          args = ["-q"];
        };
      }
    ];
  };

  home.packages = with pkgs; [
    # zls
    # clang-tools
    alejandra
    nil
    lua-language-server
    # black
    # nodePackages.typescript-language-server
  ];
}
