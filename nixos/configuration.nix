# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs;[
    bat # cat with syntax highlighting
    binutils # Tools for manipulating binaries (linker, assembler, etc.) (wrapper script)
    bottom
    btop
    delta # Syntax-highlighting pager for git
    eza # replacement for ls
    fastfetch # system information
    fd # fast find
    gcc
    git
    gnumake # make
    neovim
    pkg-config # Tool that allows packages to find out information about other packages (wrapper script)
    ripgrep # fast grep
    unzip # Extraction utility for archives compressed in .zip format
    vim
    wget
  ];

  users.users.kerorinnf = {
    isNormalUser = true;
    description = "kerorinnf";
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  programs.nix-ld.enable = true; # Run unpatched dynamic binaries

  security.sudo.wheelNeedsPassword = true;

  wsl.enable = true;
  wsl.defaultUser = "kerorinnf";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
