import { LynxEncodePlugin, LynxTemplatePlugin } from "@lynx-js/template-webpack-plugin";
import { defineConfig } from "@rspack/cli";

/** SWC downlevel transforms for Lynx main-thread (lepusng / ES2019 baseline) */
const mainThreadSwc = {
  jsc: {
    parser: { syntax: "ecmascript" },
    loose: true,
  },
  env: {
    targets: { chrome: "80" },
    include: [
      "transform-nullish-coalescing-operator",
      "transform-optional-chaining",
      "transform-class-properties",
      "transform-private-methods",
    ],
  },
};

export default defineConfig({
  entry: {
    main: './dist/all.js',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [{ loader: "builtin:swc-loader", options: mainThreadSwc }],
      },
    ],
  },
  plugins: [
    new LynxEncodePlugin(),
    new LynxTemplatePlugin({
      filename: "main.lynx.bundle",
      intermediate: "main",
    }),
    (compiler) => {
      compiler.hooks.thisCompilation.tap(
        "MarkMainThreadWebpackPlugin",
        (compilation) => {
          compilation.hooks.processAssets.tap(
            "MarkMainThreadWebpackPlugin",
            () => {
              const asset = compilation.getAsset(`main.js`);
              compilation.updateAsset(asset.name, asset.source, {
                ...asset.info,
                "lynx:main-thread": true,
              });
            },
          );
        },
      );
    },
  ],
});
