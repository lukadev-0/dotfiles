import { onCleanup } from "ags";
import { Astal, Gdk, Gtk } from "ags/gtk4";

const { TOP, LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor;

export function Background({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
  const win = (
    <window
      class="Background"
      layer={Astal.Layer.BACKGROUND}
      gdkmonitor={gdkmonitor}
      anchor={TOP | LEFT | BOTTOM | RIGHT}
      exclusivity={Astal.Exclusivity.IGNORE}
      visible
    ></window>
  ) as Gtk.Window;

  onCleanup(() => {
    win.destroy();
  });

  return win;
}
