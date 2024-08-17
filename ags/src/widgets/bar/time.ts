import styles from "./time.module.scss";

const time = Variable("", {
  poll: [
    1000,
    () => {
      return new Date().toLocaleTimeString("en-UK", {
        minute: "2-digit",
        hour: "2-digit",
      });
    },
  ],
});

export function Time() {
  return Widget.Button({
    className: styles.time,
    child: Widget.Label({
      hpack: "center",
      label: time.bind(),
    }),
  });
}
