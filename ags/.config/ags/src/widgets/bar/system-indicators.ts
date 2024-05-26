const network = await Service.import("network");
const audio = await Service.import("audio");
const bluetooth = await Service.import("bluetooth");

function NetworkIndicator() {
  return Widget.Icon({
    setup: (self) =>
      self.hook(network, (self) => {
        const icon = network[network.primary || "wifi"]?.icon_name;
        self.icon = icon || "";
      }),
  });
}

function VolumeIndicator() {
  return Widget.Icon({
    className: "bar-system-indicators-icon",
    setup: (self) =>
      self.hook(audio.speaker, () => {
        if (audio.speaker.is_muted) {
          self.icon = `audio-volume-muted-symbolic`;
          return;
        }

        const vol = audio.speaker.volume * 100;
        const icon = (
          [
            [101, "overamplified"],
            [67, "high"],
            [34, "medium"],
            [1, "low"],
            [0, "muted"],
          ] as const
        ).find(([threshold]) => threshold <= vol)?.[1];

        self.icon = `audio-volume-${icon}-symbolic`;
      }),
  });
}

function MicIndicator() {
  return Widget.Revealer({
    setup: (self) =>
      self.hook(audio, (self) => {
        self.reveal_child =
          audio.microphones.length > 0 && Boolean(audio.microphone.is_muted);
      }),
    transitionDuration: 200,
    transition: "slide_left",
    child: Widget.Icon({
      className: "bar-system-indicators-icon",
      icon: "microphone-disabled-symbolic",
    }),
  });
}

function BluetoothIndicator() {
  return Widget.Revealer({
    setup: (self) =>
      self.hook(bluetooth, (self) => {
        self.reveal_child = bluetooth.connected_devices.length > 0;
      }),
    transitionDuration: 200,
    transition: "slide_left",
    child: Widget.Icon({
      className: "bar-system-indicators-icon",
      icon: "bluetooth-symbolic",
    }),
  });
}

export function SystemIndicators() {
  return Widget.Button({
    className: "bar-button bar-system-indicators",
    onClicked: () => {
      App.toggleWindow("control-center");
    },
    setup: (self) => {
      self.hook(
        App,
        (self, windowName, visible) => {
          if (windowName === "control-center") {
            self.toggleClassName("active", visible);
          }
        },
        "window-toggled",
      );
    },
    child: Widget.Box({
      children: [
        VolumeIndicator(),
        MicIndicator(),
        BluetoothIndicator(),
        NetworkIndicator(),
      ],
    }),
  });
}
