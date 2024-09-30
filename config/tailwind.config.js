const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  "content": [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,html}",
    "./public/*.html"
  ],

  "theme": {
    "extend": {
      "fontFamily": {
        "sans": ["Inter var", ...fontFamily.sans]
      }
    }
  },

  "plugins": [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries")
  ]
};
