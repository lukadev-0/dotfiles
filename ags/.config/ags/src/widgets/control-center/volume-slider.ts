const audio = await Service.import("audio");

export function VolumeSlider(type: "speaker" | "microphone") {
  return Widget.Revealer({
    revealChild: audio.bind(`${type}s`).as((devices) => devices.length > 0),
    child: Widget.Box({
      className: "control-center-volume-slider",
      children: [
        Widget.Button({
          vpack: "center",
          child: Widget.Icon({
            icon: audio[type]
              .bind("is_muted")
              .as((muted) =>
                type === "speaker"
                  ? muted
                    ? "audio-volume-muted-symbolic"
                    : "audio-volume-high-symbolic"
                  : muted
                    ? "microphone-disabled-symbolic"
                    : "audio-input-microphone-symbolic",
              ),
          }),
          onClicked: () => {
            audio[type].is_muted = !audio[type].is_muted;
          },
        }),
        Widget.Slider({
          hexpand: true,
          drawValue: false,
          onChange: ({ value }) => (audio[type].volume = value),
          value: audio[type].bind("volume"),
        }),
      ],
    }),
  });
}
