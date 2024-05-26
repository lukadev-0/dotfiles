import { Subprocess } from "bun";
import { watch } from "fs";
import * as path from "path";
import * as sass from "sass-embedded";

let timeout: undefined | Timer = undefined;
let ags: undefined | Subprocess = undefined;

async function start() {
  console.log("building...");

  const [, sassResult] = await Promise.all([
    Bun.build({
      entrypoints: ["./src/index.ts"],
      outdir: "./build",
    }),
    sass.compileAsync(path.resolve(import.meta.dir, "../src/style.scss"), {
      loadPaths: [path.resolve(import.meta.dir, "../src")],
    }),
  ]);

  await Bun.write("./build/style.css", sassResult.css);

  if (ags) {
    ags.kill();
    console.log("restarting ags...");
  }

  ags = Bun.spawn(["ags"]);

  console.log("ags started");
}

const watcher = watch(
  path.join(import.meta.dir, "../src"),
  { recursive: true },
  () => {
    if (timeout) return;

    timeout = setTimeout(async () => {
      try {
        await start();
      } catch (e) {
        console.error(e);
      }
      timeout = undefined;
    }, 200) as unknown as Timer;
  },
);

process.on("SIGINT", () => {
  watcher.close();
  if (ags) {
    ags.kill();
  }

  process.exit(0);
});

try {
  await start();
} catch (e) {
  console.error(e);
}
