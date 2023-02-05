import { I18n } from "i18n-js/dist/require";

const i18n = new I18n(
  Object.assign(
    {},
    require("../../config/locales/en.yml")
  )
);

i18n.defaultLocale = window.I18n.defaultLocale;
i18n.locale        = window.I18n.locale;

export default i18n;
