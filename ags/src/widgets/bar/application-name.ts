import { hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";
import { applicationMap } from "src/application-info";

const hostname = Utils.exec("uname -n");

export function ApplicationName() {
  return Widget.Label({
    label: hyprland.active.client.bind("class").as((c) => {
      if (c == "") return hostname;

      const app = applicationMap.value.get(c);
      if (app) return app.name;

      return c;
    }),
  });
}
