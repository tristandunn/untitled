import path from "node:path";

const applicationRoot = `${path.resolve("./")}/app/javascript`;

export async function resolve(specifier, context, nextResolve) {
  if (specifier.startsWith("@app")) {
    specifier = specifier.replace("@app", applicationRoot);
  }

  return nextResolve(specifier, context);
}
