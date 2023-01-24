const esbuild = require("esbuild"),
      { yamlPlugin } = require("esbuild-plugin-yaml");

(async () => {
  const context = await esbuild.context({
    bundle      : true,
    entryPoints : ["app/javascript/application.js"],
    logLevel    : "debug",
    minify      : process.env.NODE_ENV === "production",
    outfile     : "app/assets/builds/application.js",
    plugins     : [yamlPlugin()]
  });

  if (process.argv.includes("--watch")) {
    await context.watch();
  } else {
    await context.rebuild();

    context.dispose();
  }
})();
