await Utils.execAsync(["bash", "-c", `cd ${App.configDir} && bun run build`]);

await import("./out/main.js");
