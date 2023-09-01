{ config, pkgs, ... }:

{
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.user.extraGroups = [ "libvirtd" ];
  users.extraGroups.vboxusers.members = [ "user" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    virtualbox = {
      host.enable = true;
      guest.enable = true;
      guest.x11 = true;
    }
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
