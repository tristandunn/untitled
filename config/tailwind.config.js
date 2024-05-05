const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  "content": [
    "./app/javascript/**/*.js",
    "./app/helpers/**/*.rb",
    "./app/views/**/*"
  ],

  "plugins": [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography")
  ],

  "theme": {
    "fontFamily": {
      "sans": ["Inter var", ...fontFamily.sans]
    }
  }
};
