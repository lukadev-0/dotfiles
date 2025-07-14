import { onCleanup } from "ags";
import { Astal, Gdk, Gtk } from "ags/gtk4";

import { BarOsIcon } from "./bar/os-icon";
import { BarWorkspaces } from "./bar/workspaces";
import { BarTime } from "./bar/time";

const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor;
const { VERTICAL } = Gtk.Orientation;
const { CENTER } = Gtk.Align;

export function Bar({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
  const win = (
    <window
      layer={Astal.Layer.BOTTOM}
      class="Bar"
      gdkmonitor={gdkmonitor}
      anchor={TOP | LEFT | BOTTOM}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      margin_top={20}
      margin_right={0}
      margin_bottom={20}
      margin_left={5}
      visible
    >
      <centerbox class="Bar-container" orientation={VERTICAL}>
        <box $type="start" orientation={VERTICAL} halign={CENTER}>
          <BarOsIcon />
          <BarWorkspaces />
        </box>
        <box $type="end" orientation={VERTICAL} halign={CENTER}>
          <BarTime />
        </box>
      </centerbox>
    </window>
  ) as Gtk.Window;

  onCleanup(() => {
    win.destroy();
  });

  return win;
}
