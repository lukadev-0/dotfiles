import { Bar } from "./widgets/bar";
import { ControlCenter } from "./widgets/control-center";

const hyprland = await Service.import("hyprland");

function sendKeywords(keywords: string[]) {
  const cmd = keywords.map((keyword) => `keyword ${keyword}`).join("; ");
  hyprland.message(`[[BATCH]]/${cmd}`);
}

sendKeywords([
  "layerrule blur,bar",
  "layerrule blur,control-center",
  "layerrule ignorealpha[0.97],control-center",
]);

App.config({
  style: "./build/style.css",
  windows: [Bar(), ControlCenter()],
});
