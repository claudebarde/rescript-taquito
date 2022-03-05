const Taquito = require("@taquito/taquito");

var toolkit = new Taquito.TezosToolkit("https://mainnet.api.tez.ie");
var user_balance = {
  contents: 0
};
toolkit.tz
  .getBalance("tz1Me1MGhK7taay748h4gPnX2cXvbgL6xsYL")
  .then(function (big_balance) {
    return Promise.resolve(big_balance.toNumber());
  })
  .then(function (balance) {
    user_balance.contents = balance;
    console.log(balance);
    return Promise.resolve();
  }),
  function (err) {
    return Promise.resolve((console.log(err), undefined));
  };
console.log("what:", undefined);
console.log("balance:", user_balance.contents);
