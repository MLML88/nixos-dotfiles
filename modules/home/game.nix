{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher # Modded Minecraft
    discord
  ];
}