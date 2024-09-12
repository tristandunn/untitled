const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  "content": [
    "./app/javascript/**/*.js",
    "./app/helpers/**/*.rb",
    "./app/views/**/*"
  ],

  "plugins": [require("@tailwindcss/forms")],

  "theme": {
    "fontFamily": {
      "sans": ["Inter var", ...fontFamily.sans]
    }
  }
};
