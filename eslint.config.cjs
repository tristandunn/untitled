const js = require("@eslint/js"),
      stylistic = require("@stylistic/eslint-plugin-js");

module.exports = [
  {
    "files": ["**/*.js"],
    "ignores": [
      "app/assets/builds/**",
      "app/assets/config/manifest.js",
      "node_modules/**",
      "vendor/**"
    ],
    "languageOptions": {
      "globals": {
        "document": "readonly",
        "module": "readonly",
        "require": "readonly",
        "window": "readonly"
      },
      "parser": require("@babel/eslint-parser"),
      "parserOptions": {
        "sourceType": "module"
      }
    },
    "plugins": {
      "@stylistic/js": stylistic
    },
    "rules": {
      ...js.configs.recommended.rules,
      ...stylistic.configs["all-flat"].rules,

      "arrow-body-style": ["error", "always"],
      "no-magic-numbers": ["error", { "ignore": [0, 1] }],

      "@stylistic/js/array-element-newline": ["error", "consistent"],
      "@stylistic/js/function-call-argument-newline": ["error", "consistent"],
      "@stylistic/js/function-paren-newline": ["error", "consistent"],
      "@stylistic/js/indent": [
        "error",
        2, /* eslint no-magic-numbers: 0 */
        {
          "VariableDeclarator": {
            "const": 3,
            "let": 2,
            "var": 2
          }
        }
      ],
      "@stylistic/js/lines-around-comment": ["error", { "allowClassStart": true }],
      "@stylistic/js/object-curly-spacing": ["error", "always"],
      "@stylistic/js/padded-blocks": "off",
      "@stylistic/js/space-before-function-paren": "off"
    }
  },
  {
    "files": ["spec/**/*.js"],
    "languageOptions": {
      "globals": {
        "afterEach": "readonly",
        "beforeEach": "readonly",
        "context": "readonly",
        "describe": "readonly",
        "expect": "readonly",
        "global": "readonly",
        "it": "readonly",
        "sinon": "readonly"
      }
    },
    "rules": {
      "no-magic-numbers": "off"
    }
  }
];
