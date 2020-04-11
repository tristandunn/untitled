const chai      = require("chai"),
      sinon     = require("sinon"),
      sinonChai = require("sinon-chai"),
      { JSDOM } = require("jsdom");

chai.use(sinonChai);

global.window    = (new JSDOM()).window;
global.document  = global.window.document;
global.expect    = chai.expect;
global.navigator = { userAgent: "node.js" };
global.sinon     = sinon.createSandbox();

global.window.I18n = {
  defaultLocale : "en",
  locale        : "en-US"
};
