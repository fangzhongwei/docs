namespace java com.jxjxgo.casino.memberber.rpc
#@namespace scala com.jxjxgo.casino.memberber.rpc

struct ThirdProfile {
    1: i16 plateform = 0,
    2: string _id = "",
    3: string _name = "",
    4: string _alias = "",
    5: optional list<byte> _smallPhoto,
    6: optional list<byte> _bigPhoto,
    7: bool _hasIconImage = false,
    8: bool _hasHiResImage = false,
    9: string _iconImageUrl = "",
    10: string _hiResImageUrl = "",
}

struct MemberBaseResponse {
    1: string code = "0",
}

struct MemberResponse {
    1: string code = "0",
    2: i64 memberId = 0,
    3: i16 status = 0,
    4: string nickName = "",
    5: string avatarUrl = "",
    6: i64 gmtCreate = 0,
    7: i64 gmtUpdate = 0,
}

service MemberEndpoint {
    MemberBaseResponse register(1: string traceId, 2: ThirdProfile thirdProfile),
    MemberResponse getMemberById(1: string traceId, 2: i64 memberId),
    MemberResponse getMemberByThirdpartId(1: string traceId, 2: i16 plateform, string thirdpartId),
    MemberBaseResponse updateMemberStatus(1: string traceId, 2: i64 memberId, 3: i16 status),
    MemberBaseResponse updateNickName(1: string traceId, 2: i64 memberId, 3: string nickName),
}

