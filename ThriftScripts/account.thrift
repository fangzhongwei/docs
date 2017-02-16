namespace java com.jxjxgo.account.rpc.domain
#@namespace scala com.jxjxgo.account.rpc.domain

struct DepositRequest {
    1: i64 memberId = 0,
    2: i32 deviceType = 0,
    3: string priceCode  = "",
    4: string channelCode  = "",
    5: string price  = "",
    6: i32 diamondAmount = 0,
    7: string ext1  = "",
    8: string ext2 = "",
    9: string ext3 = "",
    10: string ext4 = "",
    11: string ext5 = "",
}

struct SettleRequest {
    1: i64 gameId = 0,
    2: i32 deviceType = 0,
    3: i64 memberId1 = 0,
    4: i32 amount1 = 0,
    5: i64 memberId2 = 0,
    6: i32 amount2 = 0,
    7: i64 memberId3 = 0,
    8: i32 amount3 = 0,
}

struct AccountBaseResponse {
    1:string code = "",
}

struct DiamondAccountResponse {
    1: string code = "",
    2: i64 accountId = 0,
    3: i32 deviceType = 0,
    4: i64 memberId = 0,
    5: i32 amount = 0,
    6: i64 gmtCreate = 0,
    7: i64 gmtUpdate = 0,
}

struct DepositRequestResponse {
    1: string code = "",
    2: string paymentVoucherNo = "",
    3: i32 tradeStatus = 0,
    4: string extUrl = "",
    5: string ext1 = "",
    6: string ext2 = "",
    7: string ext3 = "",
    8: string ext4 = "",
    9: string ext5 = "",
}

struct DepositResponse {
    1: string code = "",
    2: string paymentVoucherNo = "",
    3: i64 accountId = 0,
    4: i64 memberId = 0,
    5: i32 tradeType = 0,
    6: i32 tradeStatus = 0,
    7: i32 diamondAcount = 0,
    8: string amount = "",
    9: i64 gmtCreate = 0,
    10: i64 gmtUpdate = 0,
}

struct DiamondPrice {
    1: string code = "",
    2: i32 diamondAmount = 0,
    3: string price = "",
    4: i32 deviceType = 0,
}

struct Channel {
    1: string code = "",
    2: string name = "",
    3: i32 deviceType = 0,
}

struct PriceListResponse {
    1: string code = "",
    2: list<DiamondPrice> priceList,
}

struct ChannelListResponse {
    1: string code = "",
    2: list<Channel> channelList,
}

service AccountEndpoint {
    AccountBaseResponse createAccount(1: string traceId, 2:i64 memberId, 3: i32 deviceType = 0),
    DiamondAccountResponse getAccount(1: string traceId, 2:i64 memberId, 3: i32 deviceType = 0),
    PriceListResponse getPriceList(1: string traceId, 2: i32 deviceType = 0),
    ChannelListResponse getChannelList(1: string traceId, 3: i32 deviceType = 0)
    DepositRequestResponse deposit(1: string traceId, 2: DepositRequest request),
    DepositResponse queryDepositOrder(1: string traceId, 2: string paymentVoucherNo),
    AccountBaseResponse settle(1: string traceId, 2: SettleRequest request),
}