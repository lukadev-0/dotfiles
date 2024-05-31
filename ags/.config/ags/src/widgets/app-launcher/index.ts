import { Application } from "types/service/applications";

const applications = await Service.import("applications");

export function AppLauncher() {
  const query = Variable("");
  let results: Application[];

  const list = Widget.Box({
    className: "app-launcher-list",
    vertical: true,
    spacing: 4,
  }).hook(query, (self) => {
    results = applications.query(query.value);
    self.children = results.map((app, i) => {
      return Widget.Button({
        className: "app-launcher-item",
        tooltip_text: app.executable,
        on_clicked: () => {
          app.launch();
          App.closeWindow("app-launcher");
        },
        child: Widget.Box({
          hpack: "start",
          spacing: 6,
          children: [
            Widget.Icon({
              hpack: "start",
              icon: app.icon_name ?? "",
            }),
            Widget.Label({
              label: app.name,
            }),
          ],
        }),
      });
    });
  });

  return Widget.Window({
    name: "app-launcher",
    className: "app-launcher",
    title: "App Launcher",
    layer: "overlay",
    keymode: "exclusive",
    visible: false,

    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow("app-launcher");
      }),

    child: Widget.Box({
      className: "app-launcher-content",
      vertical: true,

      children: [
        Widget.Entry({
          className: "app-launcher-search",
          placeholder_text: "Applications",
          visibility: true,
          primary_icon_name: "system-search-symbolic",

          on_accept: () => {
            results[0]?.launch();
            App.closeWindow("app-launcher");
          },
          on_change: ({ text }) => (query.value = text ?? ""),
        }),

        Widget.Box({
          className: "app-launcher-divider",
        }),

        Widget.Scrollable({
          className: "app-launcher-scroll",
          hscroll: "never",
          child: list,
        }),
      ],
    }),
  });
}
