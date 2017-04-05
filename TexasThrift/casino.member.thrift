namespace java com.jxjxgo.casino.memberber.rpc
#@namespace scala com.jxjxgo.casino.memberber.rpc

struct ThirdProfile {
    1: i16 platform = 0,
    2: string id = "",
    3: string name = "",
    4: string alias = "",
    5: string avatarUrl = "",
    6: string avatarMd5 = "",
    7: string photoUrl = "",
    8: string photoMd5 = "",
}

struct MemberBaseResponse {
    1: string code = "0",
}

struct MemberResponse {
    1: string code = "0",
    2: i64 memberId = 0,
    3: i16 platform = 0,
    4: i16 status = 0,
    5: string nickName = "",
    6: string avatarUrl = "",
    7: string avatarMd5 = "",
    8: string photoUrl = "",
    9: string photoMd5 = "",
    10: i64 gmtCreate = 0,
    11: i64 gmtUpdate = 0,
}

service MemberEndpoint {
    MemberResponse register(1: string traceId, 2: ThirdProfile thirdProfile),
    MemberResponse getMemberById(1: string traceId, 2: i64 memberId),
    MemberResponse getMemberByThirdpartId(1: string traceId, 2: i16 platform, string thirdpartId),
    MemberBaseResponse updateMemberStatus(1: string traceId, 2: i64 memberId, 3: i16 status),
    MemberBaseResponse updateNickName(1: string traceId, 2: i64 memberId, 3: string nickName),
}

