/* eslint-disable complexity */

module.exports = function(api) {
  let validEnv         = ["development", "test", "production"],
      currentEnv       = api.env(),
      isTestEnv        = api.env("test"),
      isDevelopmentEnv = api.env("development"),
      isProductionEnv  = api.env("production");

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      "Please specify a valid `NODE_ENV` or " +
        "`BABEL_ENV` environment variables. Valid values are `development`, " +
        "`test`, and `production`. Instead, received: " +
        JSON.stringify(currentEnv) +
        "."
    );
  }

  return {
    presets : [
      isTestEnv && [
        "@babel/preset-env",
        { targets: { node: "current" } }
      ],
      (isProductionEnv || isDevelopmentEnv) && [
        "@babel/preset-env",
        {
          corejs             : 3,
          modules            : false,
          exclude            : ["transform-typeof-symbol"],
          useBuiltIns        : "entry",
          forceAllTransforms : true
        }
      ]
    ].filter(Boolean),

    plugins : [
      "@babel/plugin-syntax-dynamic-import",
      isTestEnv && "babel-plugin-dynamic-import-node",
      isTestEnv && "babel-plugin-istanbul",
      "@babel/plugin-transform-destructuring",
      [
        "@babel/plugin-transform-class-properties",
        { loose: true }
      ],
      [
        "@babel/plugin-transform-object-rest-spread",
        { useBuiltIns: true }
      ],
      [
        "@babel/plugin-transform-private-methods",
        { loose: true }
      ],
      [
        "@babel/plugin-transform-private-property-in-object",
        { loose: true }
      ],
      [
        "@babel/plugin-transform-regenerator",
        { async: false }
      ]
    ].filter(Boolean)
  };
};
