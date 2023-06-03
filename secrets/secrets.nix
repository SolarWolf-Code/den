let
  wolf = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjplBbiQP/MtoJsx4jh/nJOHZS6O4VsdY/idmBi9j615ULTD5Ny+/k2ekfwJ1Of+zKUpHcj49asU8ztNWCVaSQJK4ZKOPoo9B8RlaBJ5syF5HvAiX9tEAQlnh4pfZKOl89CRw1v9dPiuZlKbHGTxBA1LxnIZ8UQ1at/3Eq/R7Ih5OnoYXsN3QGJxHVyombfnNMp+JCx7z1SsbrHnPpvMyHk3eVpPrAvDfbKPo+TO1Oy6b78jfXn4DUdPmmWG63h0voZHRvVWZ6YmIFwiv02E0UDqnu6S6AFJVzclk2triPdX7ep8TsB53LDSRI/1LKHWUjFXkCGzcYg39Ch2WV9uj+n8+o6EGqielSWU/XK8WbfiwdCeMsY2x0uUiZDyDOQdSEsYU7kt3/zOqos3oCVlLHDdCqnOnjahAor/E0iU0r5aEJj+bchZgjISY8NiUPCdHWvg9ntUGum0v0I/bVyRd1RHChQhpn7OdAeUnq//4E2iPZVuAT12p211qdD0rOsOE=";
  users = [wolf];

  wolf-nix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIERd8oH0VAIEMWDNketDMpmYqwAf5CWsprdCADSBOHks";
  den = [wolf-nix];

  in {
  	"ovpn-creds.age".publicKeys = users ++ den;
  }
