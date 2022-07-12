import 'dart:convert';
/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"textreghead":"Register","edtIDreg":"Student code / Teacher code","edtphonereg":"Tel","edtemailreg":"Email","edtnamereg":"Name","edtlnamereg":"Lastname","edtpassreg":"Password","edtcpassreg":"Confirm password","titleconregis":"Confirm register","textotpwillsent":"OTP will sent to","textpleaseconfirm":"Please confirm","textsentotpagain":"Sent OTP again","textotp":"OTP","btnsignup":"Sign up","btnconfirm":"Confirm"}}

ScreenRegisterResponse screenregisterresponseFromJson(String str) => ScreenRegisterResponse.fromJson(json.decode(str));
String registerwordingdartToJson(ScreenRegisterResponse data) => json.encode(data.toJson());
class ScreenRegisterResponse {
  ScreenRegisterResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenRegisterResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenRegisterResponse copyWith({  Head? head,
  Body? body,
}) => ScreenRegisterResponse(  head: head ?? _head,
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

/// screeninfo : {"textreghead":"Register","edtIDreg":"Student code / Teacher code","edtphonereg":"Tel","edtemailreg":"Email","edtnamereg":"Name","edtlnamereg":"Lastname","edtpassreg":"Password","edtcpassreg":"Confirm password","titleconregis":"Confirm register","textotpwillsent":"OTP will sent to","textpleaseconfirm":"Please confirm","textsentotpagain":"Sent OTP again","textotp":"OTP","btnsignup":"Sign up","btnconfirm":"Confirm"}

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

/// textreghead : "Register"
/// edtIDreg : "Student code / Teacher code"
/// edtphonereg : "Tel"
/// edtemailreg : "Email"
/// edtnamereg : "Name"
/// edtlnamereg : "Lastname"
/// edtpassreg : "Password"
/// edtcpassreg : "Confirm password"
/// titleconregis : "Confirm register"
/// textotpwillsent : "OTP will sent to"
/// textpleaseconfirm : "Please confirm"
/// textsentotpagain : "Sent OTP again"
/// textotp : "OTP"
/// btnsignup : "Sign up"
/// btnconfirm : "Confirm"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? textreghead, 
      String? edtIDreg, 
      String? edtphonereg, 
      String? edtemailreg, 
      String? edtnamereg, 
      String? edtlnamereg, 
      String? edtpassreg, 
      String? edtcpassreg, 
      String? titleconregis, 
      String? textotpwillsent, 
      String? textpleaseconfirm, 
      String? textsentotpagain, 
      String? textotp, 
      String? btnsignup, 
      String? btnconfirm,}){
    _textreghead = textreghead;
    _edtIDreg = edtIDreg;
    _edtphonereg = edtphonereg;
    _edtemailreg = edtemailreg;
    _edtnamereg = edtnamereg;
    _edtlnamereg = edtlnamereg;
    _edtpassreg = edtpassreg;
    _edtcpassreg = edtcpassreg;
    _titleconregis = titleconregis;
    _textotpwillsent = textotpwillsent;
    _textpleaseconfirm = textpleaseconfirm;
    _textsentotpagain = textsentotpagain;
    _textotp = textotp;
    _btnsignup = btnsignup;
    _btnconfirm = btnconfirm;
}

  Screeninfo.fromJson(dynamic json) {
    _textreghead = json['textreghead'];
    _edtIDreg = json['edtIDreg'];
    _edtphonereg = json['edtphonereg'];
    _edtemailreg = json['edtemailreg'];
    _edtnamereg = json['edtnamereg'];
    _edtlnamereg = json['edtlnamereg'];
    _edtpassreg = json['edtpassreg'];
    _edtcpassreg = json['edtcpassreg'];
    _titleconregis = json['titleconregis'];
    _textotpwillsent = json['textotpwillsent'];
    _textpleaseconfirm = json['textpleaseconfirm'];
    _textsentotpagain = json['textsentotpagain'];
    _textotp = json['textotp'];
    _btnsignup = json['btnsignup'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _textreghead;
  String? _edtIDreg;
  String? _edtphonereg;
  String? _edtemailreg;
  String? _edtnamereg;
  String? _edtlnamereg;
  String? _edtpassreg;
  String? _edtcpassreg;
  String? _titleconregis;
  String? _textotpwillsent;
  String? _textpleaseconfirm;
  String? _textsentotpagain;
  String? _textotp;
  String? _btnsignup;
  String? _btnconfirm;
Screeninfo copyWith({  String? textreghead,
  String? edtIDreg,
  String? edtphonereg,
  String? edtemailreg,
  String? edtnamereg,
  String? edtlnamereg,
  String? edtpassreg,
  String? edtcpassreg,
  String? titleconregis,
  String? textotpwillsent,
  String? textpleaseconfirm,
  String? textsentotpagain,
  String? textotp,
  String? btnsignup,
  String? btnconfirm,
}) => Screeninfo(  textreghead: textreghead ?? _textreghead,
  edtIDreg: edtIDreg ?? _edtIDreg,
  edtphonereg: edtphonereg ?? _edtphonereg,
  edtemailreg: edtemailreg ?? _edtemailreg,
  edtnamereg: edtnamereg ?? _edtnamereg,
  edtlnamereg: edtlnamereg ?? _edtlnamereg,
  edtpassreg: edtpassreg ?? _edtpassreg,
  edtcpassreg: edtcpassreg ?? _edtcpassreg,
  titleconregis: titleconregis ?? _titleconregis,
  textotpwillsent: textotpwillsent ?? _textotpwillsent,
  textpleaseconfirm: textpleaseconfirm ?? _textpleaseconfirm,
  textsentotpagain: textsentotpagain ?? _textsentotpagain,
  textotp: textotp ?? _textotp,
  btnsignup: btnsignup ?? _btnsignup,
  btnconfirm: btnconfirm ?? _btnconfirm,
);
  String? get textreghead => _textreghead;
  String? get edtIDreg => _edtIDreg;
  String? get edtphonereg => _edtphonereg;
  String? get edtemailreg => _edtemailreg;
  String? get edtnamereg => _edtnamereg;
  String? get edtlnamereg => _edtlnamereg;
  String? get edtpassreg => _edtpassreg;
  String? get edtcpassreg => _edtcpassreg;
  String? get titleconregis => _titleconregis;
  String? get textotpwillsent => _textotpwillsent;
  String? get textpleaseconfirm => _textpleaseconfirm;
  String? get textsentotpagain => _textsentotpagain;
  String? get textotp => _textotp;
  String? get btnsignup => _btnsignup;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textreghead'] = _textreghead;
    map['edtIDreg'] = _edtIDreg;
    map['edtphonereg'] = _edtphonereg;
    map['edtemailreg'] = _edtemailreg;
    map['edtnamereg'] = _edtnamereg;
    map['edtlnamereg'] = _edtlnamereg;
    map['edtpassreg'] = _edtpassreg;
    map['edtcpassreg'] = _edtcpassreg;
    map['titleconregis'] = _titleconregis;
    map['textotpwillsent'] = _textotpwillsent;
    map['textpleaseconfirm'] = _textpleaseconfirm;
    map['textsentotpagain'] = _textsentotpagain;
    map['textotp'] = _textotp;
    map['btnsignup'] = _btnsignup;
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
      int? status,
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
  int? _status;
  String? _message;
  String? _module;
Head copyWith({  int? status,
  String? message,
  String? module,
}) => Head(  status: status ?? _status,
  message: message ?? _message,
  module: module ?? _module,
);
  int? get status => _status;
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