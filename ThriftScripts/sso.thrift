namespace java com.jxjxgo.sso.rpc.domain
#@namespace scala com.jxjxgo.sso.rpc.domain

struct CreateSessionRequest {
    1: i32 clientId = 0,
    2: string version = "",
    3: i64 ip = 0,
    4: i32 deviceType = 0,
    5: string fingerPrint = "",
    6: i64 memberId = 0,
}

struct SSOBaseResponse {
    1: string code = "",
}

struct SessionResponse {
    1:  string code = "",
    2: i32 clientId = 0,
    3: string version = "",
    4: i64 ip = 0,
    5: i32 deviceType = 0,
    6: string fingerPrint = "",
    7: string token = "",
    8: i32 status = 0,
    9: i64 memberId = 0,
    10: string identity = "",
    11: string identityTicket = "",
    12: i64 gmtCreate = 0,
    13: i64 lastAccessTime = 0,
}

service SSOServiceEndpoint {
    SessionResponse createSession(1: string traceId, 2: CreateSessionRequest request),
    SSOBaseResponse logout(1: string traceId, 2: string token),
    SessionResponse touch(1: string traceId, 2: string token),
}

