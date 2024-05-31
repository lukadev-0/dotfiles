import { Bar } from "./widgets/bar";
import { ControlCenter } from "./widgets/control-center";
import { AppLauncher } from "./widgets/app-launcher";

const hyprland = await Service.import("hyprland");

function sendKeywords(keywords: string[]) {
  const cmd = keywords.map((keyword) => `keyword ${keyword}`).join("; ");
  hyprland.message(`[[BATCH]]/${cmd}`);
}

sendKeywords([
  "layerrule blur,bar",
  "layerrule blur,control-center",
  "layerrule ignorealpha[0.97],control-center",
  "layerrule blur,app-launcher",
  "layerrule ignorealpha[0.97],app-launcher",
]);

App.config({
  style: "./build/style.css",
  windows: [Bar(), ControlCenter(), AppLauncher()],
});
