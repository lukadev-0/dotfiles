import styles from "./index.module.scss";

const date = Variable(new Date(), {
  poll: [1000, () => new Date()],
});

export function Background(monitor: number) {
  return Widget.Window({
    className: styles.background,
    name: "background",
    anchor: ["top", "left", "right", "bottom"],
    layer: "background",
    monitor,
    child: Widget.Box({
      vertical: true,
      vpack: "start",
      className: styles.backgroundContent,
      children: [
        Widget.Label({
          className: styles.time,
          label: date.bind().as((date) =>
            date.toLocaleTimeString("en-UK", {
              minute: "2-digit",
              hour: "2-digit",
            }),
          ),
        }),
        Widget.Label({
          className: styles.date,
          label: date.bind().as((date) =>
            date.toLocaleDateString("en-UK", {
              weekday: "long",
              year: "numeric",
              month: "long",
              day: "numeric",
            }),
          ),
        }),
      ],
    }),
  });
}
