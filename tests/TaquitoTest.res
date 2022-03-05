open Taquito
open Promise
open Test

testAsync("Test TezosToolkit", ~timeout=10_000, done => {
    let rpc_url = "https://mainnet.api.tez.ie"
    let toolkit = tezos_toolkit(rpc_url)
    // fetches a balance
    let tezos_address = "tz1Me1MGhK7taay748h4gPnX2cXvbgL6xsYL"
    toolkit.tz
    ->get_balance(tezos_address)
    ->then(big_balance => big_balance->BigNumber.toInt->resolve)
    ->then(balance => {
        assertion(
            ~message="Tezos balance is not zero", 
            ~operator="get_balance",
            (a, b) => a > b,
            balance,
            0
        )
        done()->resolve
    })
    ->catch(err => {
        let _ = Js.log(err)
        resolve()
    })
    ->ignore
})