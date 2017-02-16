namespace java com.jxjxgo.sms.rpc.domain
#@namespace scala com.jxjxgo.sms.rpc.domain

struct SendLoginVerificationCodeRequest {
    1: i64 ip = 0;
    2: i32 deviceType = 0;
    3: string fingerPrint = "";
    4: string mobileTicket = "";
    5: i32 smsType = 0;
    6: bool resend = false;
    7: i32 lastChannel = 0;
}

struct VerifyLoginVerificationCodeRequest {
    1: i64 ip = 0;
    2: i32 deviceType = 0;
    3: string fingerPrint = "";
    4: string mobileTicket = "";
    5: i32 smsType  = 0;
    6: string verifycationCode = "";
}

struct SmsBaseResponse {
    1: string code = "";
}

struct SendLoginVerificationCodeResponse {
    1: string code = "";
    2: i32 channel = 0;
}

service SmsServiceEndpoint {
    SendLoginVerificationCodeResponse sendLoginVerificationCode(1: string traceId, 2: SendLoginVerificationCodeRequest request);
    SmsBaseResponse verifyLoginVerificationCode(1: string traceId, 2: VerifyLoginVerificationCodeRequest request);
}

