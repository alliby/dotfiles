{ pkgs, ... }: {
  home.packages = with pkgs; [ rust-nightly mold ];
  home.file.".cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    linker = "${pkgs.lib.getExe pkgs.clang}"
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold", "-C", "target-cpu=native" ]
  '';
  home.sessionVariables = {
    # https://github.com/rust-lang/rust-bindgen#environment-variables
    LIBCLANG_PATH = pkgs.lib.makeLibraryPath [pkgs.llvmPackages_latest.libclang.lib];
    # Add glibc, clang, glib and other headers to bindgen search path
    BINDGEN_EXTRA_CLANG_ARGS =
      toString
      # # Includes with normal include path
      # builtins.map (a: ''-I"${a}/include"'') [
      #   # add dev libraries here (e.g. pkgs.libvmi.dev)
      #   pkgs.glibc.dev
      # ]
      # Includes with special directory paths
      [
        ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
        ''-I"${pkgs.glib.dev}/include/glib-2.0"''
        ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
      ];
  };
}
