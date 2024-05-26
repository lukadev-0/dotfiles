import GObject from "types/@girs/gobject-2.0/gobject-2.0";
import { type IconProps } from "types/widgets/icon";
import { type LabelProps } from "types/widgets/label";
import { type Box } from "types/widgets/box";
import Gtk from "@girs/gtk-3.0";

export type ToggleControlProps = {
  icon: IconProps["icon"];
  label: LabelProps["label"];

  setup?: (self: Box<Gtk.Widget, unknown>) => void;
  onClicked: () => void;

  connection: [GObject.Object, () => boolean];
  activate: () => void;
  deactivate: () => void;
};

export function ToggleControl({
  icon,
  label,
  setup,
  onClicked,
  connection,
  activate,
  deactivate,
}: ToggleControlProps) {
  return Widget.Box({
    className: "control-center-toggle-control",
    setup: (self) => {
      setup?.(self);

      const [service, condition] = connection;
      self.hook(service, () => {
        self.toggleClassName("active", condition());
      });
    },
    children: [
      Widget.Button({
        className: "control-center-toggle-control-toggle",
        hexpand: true,
        onClicked: () => {
          if (connection[1]()) {
            deactivate();
          } else {
            activate();
          }
        },
        child: Widget.Box({
          spacing: 8,
          children: [
            Widget.Icon({
              icon: icon,
            }),
            Widget.Label({
              label: label,
            }),
          ],
        }),
      }),
      Widget.Box({
        className: "control-center-toggle-control-separator",
      }),
      Widget.Button({
        className: "control-center-toggle-control-arrow",
        child: Widget.Icon({
          icon: "pan-end-symbolic",
        }),
        onClicked: onClicked,
      }),
    ],
  });
}
