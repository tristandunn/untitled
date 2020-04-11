import I18n from "i18n-js";

I18n.defaultLocale = window.I18n.defaultLocale;
I18n.locale        = window.I18n.locale;

/* istanbul ignore next */
I18n.translations  = require.context ?
  require
    .context("../../../config/locales/", true, /\.ya?ml$/)
    .keys()
    .reduce((result, file) => {
      return Object.assign(
        result,
        require(`../../../config/locales/${file.replace("./", "")}`)
      );
    }, {}) :
  require("../../../config/locales/en.yml");

export default I18n;
