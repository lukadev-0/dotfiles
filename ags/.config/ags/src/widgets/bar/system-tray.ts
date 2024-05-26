import { TrayItem } from "types/service/systemtray";

const systemTray = await Service.import("systemtray");

function SystemTrayItem(item: TrayItem) {
  return Widget.Button({
    className: "bar-button bar-system-tray-item",
    child: Widget.Icon({
      icon: item.bind("icon"),
    }),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
  });
}

export function SystemTray() {
  return Widget.Box({
    className: "bar-system-tray",
    children: systemTray.bind("items").as((items) => items.map(SystemTrayItem)),
  });
}
