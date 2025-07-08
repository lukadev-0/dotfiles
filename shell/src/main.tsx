import { Astal } from "ags/gtk4";
import app from "ags/gtk4/app";
import { createPoll } from "ags/time";
import Gio from "gi://Gio?version=2.0";
import System from "system";

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

app.start({
  instanceName: INSTANCE_NAME,
  main() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;
    const clock = createPoll("", 1000, "date");

    return (
      <window
        visible
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
      >
        <label label={clock} />
      </window>
    );
  },
});
