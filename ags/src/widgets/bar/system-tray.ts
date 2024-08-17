import { systemTray } from "resource:///com/github/Aylur/ags/service/systemtray.js";

import styles from "./system-tray.module.scss";

export function SystemTray() {
  return Widget.Box({
    children: systemTray.bind("items").as((items) =>
      items.map((item) => {
        return Widget.Button({
          className: styles.item,
          child: Widget.Icon().bind("icon", item, "icon"),
          tooltipMarkup: item.bind("tooltip_markup"),
          onPrimaryClick: (_, event) => item.activate(event),
          onSecondaryClick: (_, event) => item.openMenu(event),
        });
      }),
    ),
  });
}
