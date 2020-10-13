import I18n from "i18n-js";

I18n.defaultLocale = window.I18n.defaultLocale;
I18n.locale        = window.I18n.locale;
I18n.translations  = Object.assign(
  {},
  require("../../../config/locales/en.yml")
);

export default I18n;
