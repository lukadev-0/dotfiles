import { createBinding, For } from "ags";
import { Gdk, Gtk } from "ags/gtk4";
import app from "ags/gtk4/app";
import Gio from "gi://Gio?version=2.0";
import System from "system";
import GObject from "gi://GObject?version=2.0";

import styles from "./styles/main.scss";

import { Background } from "./background";
import { Bar } from "./bar";

const INSTANCE_NAME = "luka-shell";

// Forward to `astal` if ran with args.
if (ARGV.length > 0) {
  const proc = new Gio.Subprocess({
    argv: ["astal", "-i", INSTANCE_NAME, ...ARGV],
    flags: Gio.SubprocessFlags.STDIN_INHERIT,
  });

  proc.init(null);
  proc.wait(null);

  System.exit(proc.get_exit_status());
}

function main() {
  eachMonitor((gdkmonitor) => <Background gdkmonitor={gdkmonitor} />);
  eachMonitor((gdkmonitor) => <Bar gdkmonitor={gdkmonitor} />);
}

function eachMonitor(f: (monitor: Gdk.Monitor) => GObject.Object) {
  const monitors = createBinding(app, "monitors");
  return <For each={monitors}>{(monitor) => f(monitor)}</For>;
}

app.start({
  instanceName: INSTANCE_NAME,
  css: styles,
  main,
});
