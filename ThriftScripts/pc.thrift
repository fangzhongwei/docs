namespace java com.jxjxgo.pc.rpc.domain
#@namespace scala com.jxjxgo.pc.rpc.domain

struct SignRequest {
    1: i64 ip = 0,
    2: i32 deviceType = 0,
    3: string fingerPrint = "",
    4: i64 memberId = 0,
    5: string paymentVoucherNo = "",
    6: string channelCode = "",
    7: string amount = "",
    8: i64 orderSubmitTime = 0,
    9: string ext1 = "",
    10: string ext2 = "",
    11: string ext3 = "",
    12: string ext4 = "",
    13: string ext5 = "",
}

struct CallbackRequest {
    1: i64 memberId = 0,
    2: string channelCode = "",
    3: string body = "",
    4: string params = "",
    5: string ext1 = "",
    6: string ext2 = "",
    7: string ext3 = "",
    8: string ext4 = "",
    9: string ext5 = "",
}

struct QueryRequest {
    1: i64 memberId = 0,
    2: string paymentVoucherNo = "",
    3: string channelCode = "",
    4: string amount = "",
    5: i64 orderSubmitTime = 0,
    6: string ext1 = "",
    7: string ext2 = "",
    8: string ext3 = "",
    9: string ext4 = "",
    10: string ext5 = "",
}

struct DownloadWaterRecordsRequest {
    1:string channelCode = "",
    2:string startDate = "",
    3:string endDate = "",
    4:string ext1 = "",
    5:string ext2 = "",
    6:string ext3 = "",
    7:string ext4 = "",
    8:string ext5 = "",
}

struct PCBaseResponse {
    1: string code = "",
}

struct SignResponse {
    1: string code = "",
    2: string paymentVoucherNo = "",
    3: string channelCode = "",
    4: string apiResultCode = "",
    5: string ext1 = "",
    6: string ext2 = "",
    7: string ext3 = "",
    8: string ext4 = "",
    9: string ext5 = "",
}

struct CallbackResponse {
    1: string code = "",
    2: string paymentVoucherNo = "",
    3: string amount = "",
    4: string channelCode = "",
    5: string apiResultCode = "",
    6: string extOrderNo = "",
    7: string extwaterNo = "",
    8: string ext1 = "",
    9: string ext2 = "",
    10: string ext3 = "",
    11: string ext4 = "",
    12: string ext5 = "",
}

struct QueryResponse {
    1: string code = "",
    2: string paymentVoucherNo = "",
    3: string amount = "",
    4: string channelCode = "",
    5: string apiResultCode = "",
    6: string extOrderNo = "",
    7: string extWaterNo = "",
    8: string ext1 = "",
    9: string ext2 = "",
    10: string ext3 = "",
    11: string ext4 = "",
    12: string ext5 = "",
}

struct WaterRecord {
    1: string extOrderNo = "",
    2: string extWaterNo = "",
    3: string paymentVoucherNo = "",
    4: string amount = "",
    5: i64 settleTime = 0,
    6: string ext1 = "",
    7: string ext2 = "",
    8: string ext3 = "",
    9: string ext4 = "",
    10: string ext5 = "",
}


struct DownloadWaterRecordsResponse {
    1: string code = "",
    2: string channelCode = "",
    3: list<WaterRecord> waterRecordlist,
}

service PCEndpoint {
    SignResponse sign(1: string traceId, 2: SignRequest request),
    CallbackResponse callback(1: string traceId, 2: CallbackRequest request),
    QueryResponse query(1: string traceId, 2: QueryRequest request),
    DownloadWaterRecordsResponse download(1: string traceId, 2: DownloadWaterRecordsRequest request),
}
