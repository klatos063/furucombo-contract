# Exit script as soon as a command fails.
# Exit script as soon as a command fails.
set -o errexit

# Executes cleanup function at script exit.
trap cleanup EXIT

cleanup() {
    # kill the ganache instance that we started (if we started one and if it's still running).
    if [ -n "$ganache_pid" ] && ps -p $ganache_pid > /dev/null; then
        kill -9 $ganache_pid
    fi
}

ganache_port=8545

ganache_running() {
    nc -z localhost "$ganache_port"
}

start_ganache() {
    TEST_MNEMONIC_PHRASE="dice shove sheriff police boss indoor hospital vivid tenant method game matter"
    ETHER_PROVIDER="0x742d35Cc6634C0532925a3b844Bc454e4438f44e"
    DAI_PROVIDER="0x5A16552f59ea34E44ec81E58b3817833E9fD5436"
    MKR_PROVIDER="0x05E793cE0C6027323Ac150F6d45C2344d28B6019"
    BAT_PROVIDER="0xBE0eB53F46cd790Cd13851d5EFf43D12404d33E8"
    USDT_PROVIDER="0x3dfd23A6c5E8BbcFc9581d2E864a68feb6a076d3"
    SUSD_PROVIDER="0x49BE88F0fcC3A8393a59d3688480d7D253C37D2A"
    WBTC_PROVIDER="0xA910f92ACdAf488fa6eF02174fb86208Ad7722ba"
    KNC_PROVIDER="0xf60c2Ea62EDBfE808163751DD0d8693DCb30019c"
    WETH_PROVIDER="0x57757e3d981446d585af0d9ae4d7df6d64647806"
    RENBTC_PROVIDER="0x35fFd6E268610E764fF6944d07760D0EFe5E40E5"
    YCRV_PROVIDER="0xbaB89CBE597876364B3bC270b1793C0e2E2aA995"
    TCRV_PROVIDER="0xa6CB47EBD1e8f9b60aF7033C5B075527409C7771"
    YFI_PROVIDER="0x3f5CE5FBFe3E9af3971dD833D26bA9b5C936f0bE"
    ALINK_PROVIDER="0xC3B2FC58A3A54739E303B5E7c53Bd6021d1d56dD"
    CURVE_SBTCCRV_PROVIDER="0x9677d26b32Eb17A2dD449caC33be9206e48F6068"
    CHI_PROVIDER="0x5B1fC2435B1f7C16c206e7968C0e8524eC29b786"
    GST2_PROVIDER="0xDB73875FB771b95d6FECf967c00E00862c133F32"
    MUSD_PROVIDER="0x11eDedebF63bef0ea2d2D071bdF88F71543ec6fB"
    COMBO_CLAIM_USER="0x1b57b3A1d5b4aa8E218F54FafB00975699463e6e"
    CURVE_MUSDCRV_PROVIDER="0x22001186729495fffc9A986040524539e78581dD"
    BALANCER_DAI_ETH_PROVIDER="0xf56D610cbF3208FF6F009Cb740BEFf4E9EF4d7ad"
    SETH_PROVIDER="0xe9cf7887b93150d4f2da7dfc6d502b216438f244"
    CURVE_SETHCRV_PROVIDER="0x1FbF5955b35728E650b56eF48eE9f3BD020164c8"
    CURVE_AAVECRV_PROVIDER="0x310D5C8EE1512D5092ee4377061aE82E48973689"
    CURVE_SCRV_PROVIDER="0x1f9bB27d0C66fEB932f3F8B02620A128d072f3d8"
    SNX_PROVIDER="0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2"
    STAKING_REWARDS_ADAPTER_REGISTRY_OWNER="0xa7248f4b85fb6261c314d08e7938285d1d86cd61"
    HBTC_PROVIDER="0x46705dfff24256421A05D056c29E81Bdc09723B8"
    OMG_PROVIDER="0x23735750a6ed0119e778d9bb969137df8cc8c3d1"
    SUSHI_PROVIDER="0xE93381fB4c4F14bDa253907b18faD305D799241a"
    xSUSHI_PROVIDER="0xf977814e90da44bfa03b6295a0616a897441acec"
    COMBO_PROVIDER="0x75e89d5979E4f6Fba9F97c104c2F0AFB3F1dcB88"
    RCOMBO_PROVIDER="0x344651A2445484bd2928eB46D2610DaaC1B42A66"
    GELATOV2_ADDRESS="0x3CACa7b48D0573D793d3b0279b5F0029180E83b6"
    MATIC_PROVIDER="0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2"
    CURVE_TRICRYPTOCRV_PROVIDER="0x9036F73391Cae26edd10412360539B7f7C86191f"
    CURVE_FACTORY_TUSD_PROVIDER="0xD34f3e85bB7C8020C7959B80a4B87a369D639dc0"
    ETH_PROVIDER_CONTRACT="0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2"

    # node_modules/.bin/ganache-cli --gasLimit 0xfffffffffff -m "$TEST_MNEMONIC_PHRASE" > /dev/null &
    node_modules/.bin/ganache-cli --gasLimit 0xfffffffffff --debug -f $ETH_MAINNET_NODE -m "$TEST_MNEMONIC_PHRASE" -u "$ETHER_PROVIDER" -u "$DAI_PROVIDER" -u "$MKR_PROVIDER" -u "$BAT_PROVIDER" -u "$USDT_PROVIDER" -u "$SUSD_PROVIDER" -u "$WBTC_PROVIDER" -u "$KNC_PROVIDER" -u "$WETH_PROVIDER" -u "$RENBTC_PROVIDER" -u "$YCRV_PROVIDER" -u "$TCRV_PROVIDER" -u "$YFI_PROVIDER" -u "$ALINK_PROVIDER" -u "$CURVE_SBTCCRV_PROVIDER" -u "$CHI_PROVIDER" -u "$GST2_PROVIDER" -u "$MUSD_PROVIDER" -u "$CURVE_MUSDCRV_PROVIDER" -u "$BALANCER_DAI_ETH_PROVIDER" -u "$COMBO_CLAIM_USER" -u "$SETH_PROVIDER" -u "$CURVE_SETHCRV_PROVIDER" -u "$CURVE_AAVECRV_PROVIDER" -u "$CURVE_SCRV_PROVIDER" -u "$SNX_PROVIDER" -u "$HBTC_PROVIDER" -u "$OMG_PROVIDER" -u "$STAKING_REWARDS_ADAPTER_REGISTRY_OWNER" -u "$SUSHI_PROVIDER" -u "$xSUSHI_PROVIDER" -u "$COMBO_PROVIDER" -u "$RCOMBO_PROVIDER" -u "$GELATOV2_ADDRESS" -u "$MATIC_PROVIDER" -u "$CURVE_TRICRYPTOCRV_PROVIDER" -u "$CURVE_FACTORY_TUSD_PROVIDER" -u "$ETH_PROVIDER_CONTRACT" >/dev/null &

    ganache_pid=$!
}

if ganache_running; then
    echo "Using existing ganache instance"
else
    echo "Starting new ganache instance"
    start_ganache
fi

truffle version

# Execute rest test files with suffix `.test.js` with single `truffle test`
node_modules/.bin/truffle test "$@"
