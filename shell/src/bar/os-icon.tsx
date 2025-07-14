import { Gtk } from "ags/gtk4";

export function BarOsIcon() {
  return (
    <box class="BarOsIcon" valign={Gtk.Align.CENTER}>
      <label label="" justify={Gtk.Justification.CENTER} hexpand />
    </box>
  );
}
