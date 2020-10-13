import fs from "fs";
import I18n from "i18n";
import YAML from "yaml";

describe("I18n", () => {
  it("assigns default locale from global object", () => {
    expect(I18n.defaultLocale).to.eq(window.I18n.defaultLocale);
  });

  it("assigns locale from global object", () => {
    expect(I18n.locale).to.eq(window.I18n.locale);
  });

  it("loads all available translations", () => {
    const files = fs.readdirSync("./config/locales");

    files.forEach((file) => {
      const translations = YAML.parse(
        fs.readFileSync(`./config/locales/${file}`).toString()
      );

      expect(I18n.translations).to.deep.include(translations);
    });
  });
});
