import 'dart:convert';
/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"textforgothead":"Forgot password","edtIDforgot":"Student code / Teacher code","edtemailforgot":"Email","btnforgotnext":"NEXT","textheadsetnewpass":"Set new password","textotpwillsent":"OTP will sent to","edtpass":"Password","edtcpass":"Confirm password","otp":"OTP","texpleaseconfirm":"Please confirm","btnsentotpagain":"Sent OTP again","btnconfirm":"Confirm "}}

ForgotPasswording forgotpasswordingFromJson(String str) => ForgotPasswording.fromJson(json.decode(str));
String forgotpasswordingToJson(ForgotPasswording data) => json.encode(data.toJson());
class ForgotPasswording {
  ForgotPasswording({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ForgotPasswording.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ForgotPasswording copyWith({  Head? head,
  Body? body,
}) => ForgotPasswording(  head: head ?? _head,
  body: body ?? _body,
);
  Head? get head => _head;
  Body? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    return map;
  }

}

/// screeninfo : {"textforgothead":"Forgot password","edtIDforgot":"Student code / Teacher code","edtemailforgot":"Email","btnforgotnext":"NEXT","textheadsetnewpass":"Set new password","textotpwillsent":"OTP will sent to","edtpass":"Password","edtcpass":"Confirm password","otp":"OTP","texpleaseconfirm":"Please confirm","btnsentotpagain":"Sent OTP again","btnconfirm":"Confirm "}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo,}){
    _screeninfo = screeninfo;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
  }
  Screeninfo? _screeninfo;
Body copyWith({  Screeninfo? screeninfo,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
);
  Screeninfo? get screeninfo => _screeninfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    return map;
  }

}

/// textforgothead : "Forgot password"
/// edtIDforgot : "Student code / Teacher code"
/// edtemailforgot : "Email"
/// btnforgotnext : "NEXT"
/// textheadsetnewpass : "Set new password"
/// textotpwillsent : "OTP will sent to"
/// edtpass : "Password"
/// edtcpass : "Confirm password"
/// otp : "OTP"
/// texpleaseconfirm : "Please confirm"
/// btnsentotpagain : "Sent OTP again"
/// btnconfirm : "Confirm "

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? textforgothead, 
      String? edtIDforgot, 
      String? edtemailforgot, 
      String? btnforgotnext, 
      String? textheadsetnewpass, 
      String? textotpwillsent, 
      String? edtpass, 
      String? edtcpass, 
      String? otp, 
      String? texpleaseconfirm, 
      String? btnsentotpagain, 
      String? btnconfirm,}){
    _textforgothead = textforgothead;
    _edtIDforgot = edtIDforgot;
    _edtemailforgot = edtemailforgot;
    _btnforgotnext = btnforgotnext;
    _textheadsetnewpass = textheadsetnewpass;
    _textotpwillsent = textotpwillsent;
    _edtpass = edtpass;
    _edtcpass = edtcpass;
    _otp = otp;
    _texpleaseconfirm = texpleaseconfirm;
    _btnsentotpagain = btnsentotpagain;
    _btnconfirm = btnconfirm;
}

  Screeninfo.fromJson(dynamic json) {
    _textforgothead = json['textforgothead'];
    _edtIDforgot = json['edtIDforgot'];
    _edtemailforgot = json['edtemailforgot'];
    _btnforgotnext = json['btnforgotnext'];
    _textheadsetnewpass = json['textheadsetnewpass'];
    _textotpwillsent = json['textotpwillsent'];
    _edtpass = json['edtpass'];
    _edtcpass = json['edtcpass'];
    _otp = json['otp'];
    _texpleaseconfirm = json['texpleaseconfirm'];
    _btnsentotpagain = json['btnsentotpagain'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _textforgothead;
  String? _edtIDforgot;
  String? _edtemailforgot;
  String? _btnforgotnext;
  String? _textheadsetnewpass;
  String? _textotpwillsent;
  String? _edtpass;
  String? _edtcpass;
  String? _otp;
  String? _texpleaseconfirm;
  String? _btnsentotpagain;
  String? _btnconfirm;
Screeninfo copyWith({  String? textforgothead,
  String? edtIDforgot,
  String? edtemailforgot,
  String? btnforgotnext,
  String? textheadsetnewpass,
  String? textotpwillsent,
  String? edtpass,
  String? edtcpass,
  String? otp,
  String? texpleaseconfirm,
  String? btnsentotpagain,
  String? btnconfirm,
}) => Screeninfo(  textforgothead: textforgothead ?? _textforgothead,
  edtIDforgot: edtIDforgot ?? _edtIDforgot,
  edtemailforgot: edtemailforgot ?? _edtemailforgot,
  btnforgotnext: btnforgotnext ?? _btnforgotnext,
  textheadsetnewpass: textheadsetnewpass ?? _textheadsetnewpass,
  textotpwillsent: textotpwillsent ?? _textotpwillsent,
  edtpass: edtpass ?? _edtpass,
  edtcpass: edtcpass ?? _edtcpass,
  otp: otp ?? _otp,
  texpleaseconfirm: texpleaseconfirm ?? _texpleaseconfirm,
  btnsentotpagain: btnsentotpagain ?? _btnsentotpagain,
  btnconfirm: btnconfirm ?? _btnconfirm,
);
  String? get textforgothead => _textforgothead;
  String? get edtIDforgot => _edtIDforgot;
  String? get edtemailforgot => _edtemailforgot;
  String? get btnforgotnext => _btnforgotnext;
  String? get textheadsetnewpass => _textheadsetnewpass;
  String? get textotpwillsent => _textotpwillsent;
  String? get edtpass => _edtpass;
  String? get edtcpass => _edtcpass;
  String? get otp => _otp;
  String? get texpleaseconfirm => _texpleaseconfirm;
  String? get btnsentotpagain => _btnsentotpagain;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textforgothead'] = _textforgothead;
    map['edtIDforgot'] = _edtIDforgot;
    map['edtemailforgot'] = _edtemailforgot;
    map['btnforgotnext'] = _btnforgotnext;
    map['textheadsetnewpass'] = _textheadsetnewpass;
    map['textotpwillsent'] = _textotpwillsent;
    map['edtpass'] = _edtpass;
    map['edtcpass'] = _edtcpass;
    map['otp'] = _otp;
    map['texpleaseconfirm'] = _texpleaseconfirm;
    map['btnsentotpagain'] = _btnsentotpagain;
    map['btnconfirm'] = _btnconfirm;
    return map;
  }

}

/// status : "200"
/// message : "success"
/// module : "login"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
      String? status, 
      String? message, 
      String? module,}){
    _status = status;
    _message = message;
    _module = module;
}

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _module = json['module'];
  }
  String? _status;
  String? _message;
  String? _module;
Head copyWith({  String? status,
  String? message,
  String? module,
}) => Head(  status: status ?? _status,
  message: message ?? _message,
  module: module ?? _module,
);
  String? get status => _status;
  String? get message => _message;
  String? get module => _module;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['module'] = _module;
    return map;
  }

}