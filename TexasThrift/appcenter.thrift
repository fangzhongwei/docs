namespace java com.jxjxgo.casino.appcenter.rpc.domain
#@namespace scala com.jxjxgo.casino.appcenter.rpc.domain

struct CheckVersionRequest {
    1 : i32 clientId = 0,
    2 : i32 releaseNo = 0,
    3 : string clientVersion = "",
}

struct ClientTraceRequest {
    1 :string traceId = "",
    2 :bool normal = true,
    3 :string errorDesc = "",
    4 :i16 networkType = 0,
    5 :i16 traceType = 0,
    6 :i32 apiId = 0,
    7 :i32 httpStatusCode = 0,
    8 :string socketAction = "",
    9 :i32 cost = 0,
    10 :i32 ping = 0,
    11 :string clientGmtCreate = "",
}

struct AppBaseResponse {
    1 : string code = "",
}

struct AppVersionResponse {
    1 : string code = "",
    2 : i32 clientId = 0,
    3 : i32 releaseNo = 0,
    4 : string clientVersion = "",
    5 : string url = "",
    6 : bool currentRelease = false,
    7 : bool forceUpgrade = false,
    8 : string releaseNote = "",
}

service AppCenterEndpoint {
    AppVersionResponse getLatestVersion(1: string traceId, 2: CheckVersionRequest req),
    AppBaseResponse saveClientTrace(1: string traceId, 2: list<ClientTraceRequest> reqList),
}