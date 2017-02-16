namespace java com.jxjxgo.gamegateway.rpc.domain
#@namespace scala com.jxjxgo.gamegateway.rpc.domain

//struct SocketResponse {
//    1: string code,
//    2: string action,
//    3: i64 gameId = 0,
//    4: i32 gameType = 0,
//    5: i32 deviceType = 0,
//    6: string cards = "",
//    7: string landlordCards = "",
//    8: i32 baseAmount = 0,
//    9: i32 multiples = 0,
//    10: string previousNickname = "",
//    11: i32 previousCardsCount = 0,
//    12: string nextNickname = "",
//    13: i32 nextCardsCount = 0,
//    14: bool choosingLandlord = false,
//    15: bool landlord = false,
//    16: bool turnToPlay = false,
//}

struct SocketResponse {
    1: string p1 = "",
    2: string p2 = "",
    3: string p3 = "",
    4: string p4 = "",
    5: string p5 = "",
    6: string p6 = "",
    7: string p7 = "",
    8: string p8 = "",
    9: string p9 = "",
    10: string p10 = "",
    11: string p11 = "",
    12: string p12 = "",
    13: string p13 = "",
    14: string p14 = "",
    15: string p15 = "",
    16: string p16 = "",
    17: string p17 = "",
    18: string p18 = "",
    19: string p19 = "",
    20: string p20 = "",
    21: string p21 = "",
    22: string p22 = "",
}

struct GameGatewayBaseResponse {
    1: string code,
}

service GameGatewayEndpoint {
    GameGatewayBaseResponse push(1: string traceId, 2: SocketResponse response),
}