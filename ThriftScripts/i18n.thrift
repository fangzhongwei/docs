namespace java com.jxjxgo.i18n.rpc.domain
#@namespace scala com.jxjxgo.i18n.rpc.domain

struct PullResourceRequest {
    1: i32 version = 0,
    2: string lan = "",
}

struct I18NBaseResponse {
    1: string code = "",
}

struct Resource {
    1:i64 id = 0,
    2:i32 type = 0,
    3:string code = "",
    4:string lan = "",
    5:string desc = "",
    6:i32 version = 0,
}

struct ResourceResponse{
    1: string code = "",
    2: i32 latestVersion = 0,
    3: list<Resource> resourceList,
}

service I18NEndpoint {
        ResourceResponse getLatest(1: string traceId, 2: string lan),
        ResourceResponse pullLatest(1: string traceId, 2: PullResourceRequest request),
}