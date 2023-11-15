{pkgs, ...}: let
  buildToolsVersion = "33.0.2";
  android = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "33.0.3";
    buildToolsVersions = [ "33.0.2" "30.0.3" ];
    includeEmulator = false;
    emulatorVersion = "31.3.14";
    platformVersions = ["30" "31" "32" "33"];
    includeSources = false;
    includeSystemImages = false;
    systemImageTypes = ["google_apis_playstore"];
    abiVersions = ["armeabi-v7a" "arm64-v8a"];
    cmakeVersions = [ "3.10.2" "3.18.1" ];
    includeNDK = true;
    ndkVersions = ["24.0.8215888"];
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    includeExtras = ["extras;google;gcm"];
    extraLicenses = [
      "android-sdk-preview-license"
      "android-googletv-license"
      "android-sdk-arm-dbt-license"
      "google-gdk-license"
      "intel-android-extra-license"
      "intel-android-sysimage-license"
      "mips-android-sysimage-license"
    ];
  };
in {
  home.packages = with pkgs; [
    android-studio
    android.androidsdk
    flutter
    cargo-ndk
    jdk17
  ];
  home.sessionVariables = rec {
    JAVA_HOME = pkgs.jdk17.home;
    ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = ANDROID_HOME;
    NDK_HOME = "${ANDROID_HOME}/ndk/";
    ANDROID_NDK_ROOT = "${ANDROID_HOME}/ndk/";
    ANDROID_NDK_HOME = "${ANDROID_HOME}/ndk/";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";
  };
}
