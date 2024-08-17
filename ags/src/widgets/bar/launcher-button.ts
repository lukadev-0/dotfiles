import styles from "./launcher-button.module.scss";

const NIXOS_ICON = "\uf313";

export function Launcher() {
  return Widget.Button({
    className: styles.launcher,
    hpack: "center",
    child: Widget.Label({
      label: NIXOS_ICON,
    }),
  });
}
