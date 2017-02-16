namespace java com.jxjxgo.memberber.rpc.domain
#@namespace scala com.jxjxgo.memberber.rpc.domain

struct MemberBaseResponse {
    1: string code = "0",
}

struct MemberResponse {
    1: string code = "0",
    2: i64 memberId = 0,
    3: string mobile = "",
    4: string mobileTicket = "",
    5: i32 status = 0,
    6: string nickName = "",
    7: string password = "",
    8: i64 gmtCreate = 0,
    9: i64 gmtUpdate = 0,
}

service MemberEndpoint {
    MemberBaseResponse register(1: string traceId, 2: string mobileTicket),
    MemberResponse getMemberById(1: string traceId, 2: i64 memberId),
    MemberResponse getMemberByMobile(1: string traceId, 2: string mobileTicket),
    MemberBaseResponse updateMemberStatus(1: string traceId, 2: i64 memberId, 3: i32 status),
    MemberBaseResponse updateNickName(1: string traceId, 2: i64 memberId, 3: string nickName),
}

