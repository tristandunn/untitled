const yaml            = require("./loaders/yaml"),
      { environment } = require("@rails/webpacker");

environment.loaders.insert("yaml", yaml);

module.exports = environment;
