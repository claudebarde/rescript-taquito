module Operation = {
  type field;
  type t;

  type block = {hash: string};

  type confirmationResult = {block};

  type result = {hash: string};
};

module Toolkit = {
    type tz_provider;
    type contract;
    type estimate;

    type toolkit = {
        tz: tz_provider,
        contract,
        operation: Operation.field,
        estimate,
    };
} 

@new @module("@taquito/taquito") external tezos_toolkit: string => Toolkit.toolkit = "TezosToolkit"
// tz accessor
external tz: (Toolkit.toolkit) => Toolkit.tz_provider = "tz"
@send external get_balance: (Toolkit.tz_provider, string) => Js.Promise.t<BigNumber.t> = "getBalance"