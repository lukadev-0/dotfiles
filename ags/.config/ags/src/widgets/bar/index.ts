import { LauncherButton } from "./launcher-button";
import { Workspaces } from "./workspaces";
import { Time } from "./time";
import { SystemIndicators } from "./system-indicators";
import { SystemTray } from "./system-tray";
import { Power } from "./power";

export function Bar() {
  return Widget.Window({
    name: "bar",
    className: "bar",
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      className: "bar-content",
      startWidget: Widget.Box({
        hpack: "start",
        children: [LauncherButton(), Workspaces()],
      }),
      endWidget: Widget.Box({
        hpack: "end",
        spacing: 2,
        children: [SystemTray(), SystemIndicators(), Time(), Power()],
      }),
    }),
  });
}
