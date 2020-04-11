module.exports = {
  test    : /\.ya?ml/,
  type    : "json",
  exclude : /node_modules/,
  use     : [{
    loader : "yaml-loader"
  }]
};
