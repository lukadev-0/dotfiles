const time = Variable("", {
  poll: [
    1000,
    function () {
      return new Date().toLocaleTimeString("en-UK", {
        minute: "2-digit",
        hour: "2-digit",
      });
    },
  ],
});

export function Time() {
  return Widget.Button({
    className: "bar-button bar-time",
    child: Widget.Label({
      hpack: "center",
      label: time.bind(),
    }),
  });
}
