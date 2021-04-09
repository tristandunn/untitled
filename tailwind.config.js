const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  future : {
    defaultLineHeights           : true,
    purgeLayersByDefault         : true,
    removeDeprecatedGapUtilities : true, // eslint-disable-line id-length
    standardFontWeights          : true
  },

  plugins : [
    require("@tailwindcss/custom-forms")
  ],

  purge : {
    enabled : process.env.NODE_ENV === "production",
    content : [
      "./app/assets/javascripts/**/*.js",
      "./app/**/*.html.erb"
    ]
  },

  theme : {
    fontFamily : {
      "sans" : ["Inter", ...fontFamily.sans]
    }
  },

  variants : {}
};
