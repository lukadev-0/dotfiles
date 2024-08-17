import { Bar } from "./widgets/bar";
import { Background } from "./widgets/background";

App.config({
  windows: [Bar(0), Background(0)],
  style: "./out/main.css",
});
