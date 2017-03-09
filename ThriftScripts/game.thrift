namespace java com.jxjxgo.gamecenter.rpc.domain
#@namespace scala com.jxjxgo.gamecenter.rpc.domain

struct OnlineRequest {
    1: i64 socketUuid,
    2: i64 memberId,
    3: i64 ip,
    4: i32 deviceType,
    5: string fingerPrint,
    6: string host,
}

struct CheckGameStatusRequest {
    1: i64 memberId = 0,
    2: string fingerPrint = "",
}

struct JoinGameRequest {
    1: i64 memberId = 0,
    2: i64 socketId = 0,
    3: i32 deviceType = 0,
    4: string fingerPrint = "",
    5: i64 ip = 0,
    6: i32 gameType = 0,
    7: i32 baseAmount = 0,
}

struct TakeLandlordRequest {
    1: i64 memberId = 0,
    2: i64 gameId = 0,
    3: bool take = false,
}

struct PlayCardsRequest {
    1: i64 memberId = 0,
    2: i64 gameId = 0,
    3: i32 seqInGame = 0,
    4: string cardsType = "",
    5: list<i32> keys,
    6: list<i32> playPoints,
    7: list<i32> handPoints,
}

struct GameBaseResponse {
    1: string code = "",
}

struct GenerateSocketIdResponse {
    1: string code = "",
    2: i64 socketId = 0,
}

struct GameTurnResponse {
    1: i64 gameId = 0,
    2: i32 gameType = 0,
    3: i32 deviceType = 0,
    4: string cards = "",
    5: string landlordCards = "",
    6: i32 baseAmount = 0,
    7: i32 multiples = 0,
    8: string previousNickname = "",
    9: i32 previousCardsCount = 0,
    10: string nextNickname = "",
    11: i32 nextCardsCount = 0,
    12: string playStatus = "",
    13: bool landlord = false,
    14: i32 seqInGame = 0,
}

struct CheckGameStatusResponse {
    1: string code = "",
    2: i64 memberId = 0,
    3: bool reconnect = false,
    4: optional GameTurnResponse turn,
}

service GameEndpoint {
    GameBaseResponse playerOnline(1: string traceId, 2: OnlineRequest request),
    GameBaseResponse playerOffline(1: string traceId, 2: i64 socketUuid, 3: i64 memberId),
    GenerateSocketIdResponse generateSocketId(1: string traceId),
    CheckGameStatusResponse checkGameStatus(1: string traceId, 2: CheckGameStatusRequest request),
    GameBaseResponse joinGame(1: string traceId, 2: JoinGameRequest request),
    GameBaseResponse takeLandlord(1: string traceId, 2: TakeLandlordRequest request),
    GameBaseResponse playCards(1: string traceId, 2: PlayCardsRequest request),
}
