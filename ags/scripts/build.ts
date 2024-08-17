import * as esbuild from "esbuild";
import { sassPlugin } from "esbuild-sass-plugin";

await esbuild.build({
  entryPoints: ["src/main.ts"],
  outdir: "out",
  bundle: true,
  external: ["resource://*", "gi://*"],
  format: "esm",
  plugins: [
    sassPlugin({
      filter: /\.module\.scss$/,
      type: "local-css",
      loadPaths: ["src"],
    }),
  ],
});
