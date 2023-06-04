# den
nixos dotfiles


Steps to rebuild:
- install nixos
- add flakes and nix-command
- `nix shell nixpkgs#git`
- `git clone https://github.com/solarwolf-code/den.git`
- `cd den`
- `cp /etc/nixos/hardware-configuration.nix nixos/`
- copy over boot.loader stuff from /etc/nixos/configuration.nix
- `sudo nixos-rebuild boot --flake .#wolf-nix`
- `reboot`
- `cd den`
- `nix develop`
- `rm -r ~/.config/fish`
- `nh home switch .`
- `reboot`


## NOTE
Will need to copy private key over to make openvpn work with secrets
