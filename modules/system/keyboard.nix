{ pkgs, ... }:

{
  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-rime
      fcitx5-mozc
      fcitx5-lua
      qt6Packages.fcitx5-chinese-addons
      qt6Packages.fcitx5-qt
    ];
  };

  environment.systemPackages = with pkgs; [
    qt6Packages.fcitx5-configtool
  ];
}
