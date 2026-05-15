{ ... }:
{
  nixos.services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
}
