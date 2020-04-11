import I18n from "i18n";

describe("I18n", () => {
  it("assigns default locale from global object", () => {
    expect(I18n.defaultLocale).to.eq(window.I18n.defaultLocale);
  });

  it("assigns locale from global object", () => {
    expect(I18n.locale).to.eq(window.I18n.locale);
  });
});
