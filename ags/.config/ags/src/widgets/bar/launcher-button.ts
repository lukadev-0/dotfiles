const ARCH_ICON = "\udb82\udcc7";

export function LauncherButton() {
  return Widget.Button({
    className: "bar-button bar-arch-icon",
    hpack: "center",
    child: Widget.Label({
      label: ARCH_ICON,
    }),
  });
}
