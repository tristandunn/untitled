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
        require("@babel/preset-env").default,
        { targets: { node: "current" } }
      ],
      (isProductionEnv || isDevelopmentEnv) && [
        require("@babel/preset-env").default,
        {
          corejs             : 3,
          modules            : false,
          exclude            : ["transform-typeof-symbol"],
          useBuiltIns        : "entry",
          forceAllTransforms : true
        }
      ],
      [
        require("@babel/preset-react").default,
        {
          useBuiltIns : true,
          development : isDevelopmentEnv || isTestEnv
        }
      ]
    ].filter(Boolean),

    plugins : [
      require("babel-plugin-macros"),
      require("@babel/plugin-syntax-dynamic-import").default,
      isTestEnv && require("babel-plugin-dynamic-import-node"),
      isTestEnv && require("babel-plugin-istanbul"),
      require("@babel/plugin-transform-destructuring").default,
      [
        require("@babel/plugin-proposal-class-properties").default,
        { loose: true }
      ],
      [
        require("@babel/plugin-proposal-object-rest-spread").default,
        { useBuiltIns: true }
      ],
      [
        require("@babel/plugin-transform-runtime").default,
        {
          corejs      : false,
          helpers     : false,
          regenerator : true
        }
      ],
      [
        require("@babel/plugin-transform-regenerator").default,
        { async: false }
      ],
      isProductionEnv && [
        require("babel-plugin-transform-react-remove-prop-types").default,
        { removeImport: true }
      ]
    ].filter(Boolean)
  };
};
