import { Time } from "./time";
import { Launcher } from "./launcher-button";
import { Workspaces } from "./workspaces";
import { SystemTray } from "./system-tray";
import { ApplicationName } from "./application-name.ts";

import { applicationMap } from "../../application-info";

import styles from "./index.module.scss";

function printAppMap() {
  for (const [c, a] of applicationMap.value.entries()) {
    console.log(`${c}: ${a.name}`);
  }
}

printAppMap();

applicationMap.connect("changed", () => printAppMap());

export function Bar(monitor: number) {
  return Widget.Window({
    monitor,
    name: `bar-${monitor}`,
    className: styles.bar,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      className: styles.barContent,
      startWidget: Widget.Box({
        vpack: "center",
        hpack: "start",
        spacing: 4,
        children: [Launcher(), ApplicationName()],
      }),
      centerWidget: Widget.Box({
        vpack: "center",
        hpack: "center",
        spacing: 4,
        children: [Workspaces()],
      }),
      endWidget: Widget.Box({
        vpack: "center",
        hpack: "end",
        spacing: 4,
        children: [SystemTray(), Time()],
      }),
    }),
  });
}
