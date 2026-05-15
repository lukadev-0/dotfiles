{ ... }:
{
  home.programs.waybar.settings = [
    {
      layer = "top";
      position = "left";
      modules-left = [ "niri/workspaces" ];
      modules-right = [ "clock" ];
      clock = {
        format = "<span>{:%m\n%d\n%H\n%M}</span>";
      };
    }
  ];
}
