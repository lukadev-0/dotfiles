import { createState } from "ags";
import { Gtk } from "ags/gtk4";
import { interval } from "ags/time";

const MONTHS = [
  "JAN",
  "FEB",
  "MAR",
  "APR",
  "MAY",
  "JUN",
  "JUL",
  "AUG",
  "SEP",
  "OCT",
  "NOV",
  "DEC",
];

export function BarTime() {
  const [now, setNow] = createState(new Date());

  interval(15000, () => {
    setNow(new Date());
  });

  const time = now.as(
    (now) =>
      `${now.getHours().toString().padStart(2, "0")}\n${now.getMinutes().toString().padStart(2, "0")}`,
  );

  const day = now.as((now) => `${now.getDate().toString().padStart(2, "0")}`);

  const month = now.as((now) => MONTHS[now.getMonth()]);

  return (
    <box class="BarTime" orientation={Gtk.Orientation.VERTICAL} spacing={6}>
      <label class="BarTime-time" label={time} />
      <box class="BarTime-date" orientation={Gtk.Orientation.VERTICAL}>
        <label class="BarTime-date-day" label={day} />
        <label class="BarTime-date-month" label={month} />
      </box>
    </box>
  );
}
