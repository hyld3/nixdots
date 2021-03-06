# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "texas";
  nixpkgs.config.allowUnfree = true;
  
  # The very essential shit I use.
  environment = {
    systemPackages = with pkgs; [
      acpi
      bat
      bspwm
      chromium
      clang
      clang-manpages
      curl
      dmenu
      docker
      emacs
      fd
      feh
      file
      fzf
      gdb
      gdb-multitarget
      git
      gobuster
      global
      gnome3.evince # Least retarded pdf viewer for latex
      htop
      killall
      kitty
      llvm
      llvmPackages.bintools
      man-db
      man-pages
      meson
      ncat
      neofetch
      ninja
      oh-my-zsh
      open-vm-tools
      openvpn
      python38Packages.pip
      python38Packages.pwntools
      polybar
      posix_man_pages
      pywal
      python38
      rofi
      scrot
      spotify
      sxhkd
      tcpdump
      texlive.combined.scheme-full # Sure its bloated, but that one tex package you are looking for is never in -medium
      tmux
      vagrant
      wget
      xlibs.xbacklight
      xlibs.xmodmap
      xorg.xinit
      zsh
    ];
  };
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens33.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    theme = "cypher";
    enable = true;
    plugins = [ "git" "man" ];
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
  };
  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
 
 # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

 services.compton.enable = true;	
 # Enable the X11 windowing system.
 services.xserver.enable = true;
 services.xserver.layout = "us";
 services.xserver.xkbOptions = "eurosign:e";
 #services.xserver.autorun = false;
 #services.xserver.exportConfiguration = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

 # Enable the KDE Desktop Environment.
 
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+bspwm";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hyld3 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

