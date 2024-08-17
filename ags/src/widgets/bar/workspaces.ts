import { hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";

import styles from "./workspaces.module.scss";

export function Workspaces() {
  return Widget.Box({
    children: Array.from({ length: 10 }, (_, i) => {
      const workspaceIdx = i + 1;

      return Widget.Button({
        className: styles.workspace,
        child: Widget.Box({
          hpack: "center",
          vpack: "center",
          className: styles.indicator,
        }),
        onClicked: () => {
          hyprland.messageAsync(`dispatch workspace ${workspaceIdx}`);
        },
        setup: (self) =>
          self.hook(hyprland, () => {
            self.toggleClassName(
              styles.occupied,
              (hyprland.getWorkspace(i + 1)?.windows || 0) > 0,
            );
            self.toggleClassName(
              styles.active,
              hyprland.active.workspace.id === i + 1,
            );
          }),
      });
    }),
  });
}
