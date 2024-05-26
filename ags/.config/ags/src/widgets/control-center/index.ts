import { ToggleControl } from "./toggle-control";
import { VolumeSlider } from "./volume-slider";
import { WifiSettings } from "./wifi";

const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");
const hyprland = await Service.import("hyprland");

const currentMenu = Variable("control-center");

App.connect("window-toggled", (_, name: string, visible: boolean) => {
  if (name === "control-center" && !visible)
    Utils.timeout(500, () => (currentMenu.value = "control-center"));
});

function SettingsHeader(label: string) {
  return Widget.Box({
    className: "control-center-settings-header",
    spacing: 4,
    children: [
      Widget.Button({
        className: "control-center-settings-header-back",
        child: Widget.Icon({
          icon: "go-previous-symbolic",
        }),
        onClicked: () => {
          currentMenu.value = "control-center";
        },
      }),
      Widget.Label({
        label: label,
      }),
    ],
  });
}

export function ControlCenter() {
  const wifiIcon = Variable("");
  const wifiLabel = Variable("");

  const bluetoothIcon = Variable("");
  const bluetoothLabel = Variable("");

  return Widget.Window({
    name: "control-center",
    className: "control-center",
    title: "Control Center",
    anchor: ["top", "right"],
    layer: "overlay",
    margins: [8, 8, 0, 0],
    visible: false,
    child: Widget.Stack({
      transition: currentMenu
        .bind()
        .as((menu) =>
          menu === "control-center" ? "slide_right" : "slide_left",
        ),
      children: {
        "control-center": Widget.Box({
          className: "control-center-content",
          vertical: true,
          spacing: 12,
          children: [
            Widget.Box({
              vertical: true,
              spacing: 4,
              children: [
                ToggleControl({
                  setup: (self) => {
                    self.hook(network, () => {
                      wifiIcon.value = network.wifi.icon_name;
                      wifiLabel.value = network.wifi.ssid || "Not connected";
                    });
                  },

                  onClicked: () => {
                    currentMenu.value = "wifi-settings";
                  },

                  icon: wifiIcon.bind(),
                  label: wifiLabel.bind(),

                  connection: [network, () => network.wifi.enabled],
                  activate: () => {
                    network.wifi.enabled = true;
                  },
                  deactivate: () => {
                    network.wifi.enabled = false;
                  },
                }),

                ToggleControl({
                  setup: (self) => {
                    self.hook(bluetooth, () => {
                      bluetoothIcon.value = bluetooth.enabled
                        ? "bluetooth-active-symbolic"
                        : "bluetooth-disabled-symbolic";

                      bluetoothLabel.value = bluetooth.enabled
                        ? bluetooth.connected_devices.length > 0
                          ? bluetooth.connected_devices[0].name
                          : "Not connected"
                        : "Disabled";
                    });
                  },

                  onClicked: () => {
                    currentMenu.value = "bluetooth-settings";
                  },

                  icon: bluetoothIcon.bind(),
                  label: bluetoothLabel.bind(),

                  connection: [bluetooth, () => bluetooth.enabled],
                  activate: () => {
                    bluetooth.toggle();
                  },
                  deactivate: () => {
                    bluetooth.toggle();
                  },
                }),
              ],
            }),

            Widget.Box({
              vertical: true,
              children: [VolumeSlider("speaker"), VolumeSlider("microphone")],
            }),

            Widget.Button({
              className: "control-center-audio-settings",
              hpack: "end",
              child: Widget.Label({
                label: "More audio settings",
              }),
              onClicked: () => {
                hyprland.message(
                  "dispatch exec [float; size 1200 800; center] pavucontrol",
                );
                App.closeWindow("control-center");
              },
            }),
          ],
        }),

        "wifi-settings": Widget.Box({
          className: "control-center-content",
          vertical: true,
          children: [SettingsHeader("Wi-Fi"), WifiSettings()],
        }),
      },
      shown: currentMenu.bind(),
    }),
  });
}
