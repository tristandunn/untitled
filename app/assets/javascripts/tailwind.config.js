const { fontFamily } = require("tailwindcss/defaultTheme");

module.exports = {
  future : {
    purgeLayersByDefault         : true,
    removeDeprecatedGapUtilities : true // eslint-disable-line id-length
  },

  plugins : [
    require("@tailwindcss/custom-forms")
  ],

  purge : {
    enabled : process.env.NODE_ENV === "production",
    content : [
      "./app/javascript/**/*.js",
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
