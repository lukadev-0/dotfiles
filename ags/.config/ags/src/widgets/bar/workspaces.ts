const hyprland = await Service.import("hyprland");

export function Workspaces() {
  return Widget.Box({
    className: "bar-workspaces",
    children: Array.from({ length: 10 }, (_, i) =>
      Widget.Button({
        className: "bar-workspaces-button",

        onClicked: () => hyprland.messageAsync(`dispatch workspace ${i + 1}`),

        child: Widget.Box({
          vpack: "center",
          hpack: "center",

          setup: (self) =>
            self.hook(hyprland, () => {
              self.toggleClassName(
                "active",
                hyprland.active.workspace.id === i + 1,
              );
              self.toggleClassName(
                "occupied",
                (hyprland.getWorkspace(i + 1)?.windows || 0) > 0,
              );
            }),
        }),
      }),
    ),
  });
}
