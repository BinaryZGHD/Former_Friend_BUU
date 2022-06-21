import 'dart:convert';
/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"textheadsetnewpass":"Change new password","edtcurrentpass":"Current password","edtnewpass":"New password","edtcpass":"Confirm password","btnforgotpass":"Forgot password ?","texpleaseconfirm":"Please confirm","btnconfirm":"Confirm "}}

ChangePasswording changepasswordingFromJson(String str) => ChangePasswording.fromJson(json.decode(str));
String changepasswordingToJson(ChangePasswording data) => json.encode(data.toJson());
class ChangePasswording {
  ChangePasswording({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ChangePasswording.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ChangePasswording copyWith({  Head? head,
  Body? body,
}) => ChangePasswording(  head: head ?? _head,
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

/// screeninfo : {"textheadsetnewpass":"Change new password","edtcurrentpass":"Current password","edtnewpass":"New password","edtcpass":"Confirm password","btnforgotpass":"Forgot password ?","texpleaseconfirm":"Please confirm","btnconfirm":"Confirm "}

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

/// textheadsetnewpass : "Change new password"
/// edtcurrentpass : "Current password"
/// edtnewpass : "New password"
/// edtcpass : "Confirm password"
/// btnforgotpass : "Forgot password ?"
/// texpleaseconfirm : "Please confirm"
/// btnconfirm : "Confirm "

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? textheadsetnewpass, 
      String? edtcurrentpass, 
      String? edtnewpass, 
      String? edtcpass, 
      String? btnforgotpass, 
      String? texpleaseconfirm, 
      String? btnconfirm,}){
    _textheadsetnewpass = textheadsetnewpass;
    _edtcurrentpass = edtcurrentpass;
    _edtnewpass = edtnewpass;
    _edtcpass = edtcpass;
    _btnforgotpass = btnforgotpass;
    _texpleaseconfirm = texpleaseconfirm;
    _btnconfirm = btnconfirm;
}

  Screeninfo.fromJson(dynamic json) {
    _textheadsetnewpass = json['textheadsetnewpass'];
    _edtcurrentpass = json['edtcurrentpass'];
    _edtnewpass = json['edtnewpass'];
    _edtcpass = json['edtcpass'];
    _btnforgotpass = json['btnforgotpass'];
    _texpleaseconfirm = json['texpleaseconfirm'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _textheadsetnewpass;
  String? _edtcurrentpass;
  String? _edtnewpass;
  String? _edtcpass;
  String? _btnforgotpass;
  String? _texpleaseconfirm;
  String? _btnconfirm;
Screeninfo copyWith({  String? textheadsetnewpass,
  String? edtcurrentpass,
  String? edtnewpass,
  String? edtcpass,
  String? btnforgotpass,
  String? texpleaseconfirm,
  String? btnconfirm,
}) => Screeninfo(  textheadsetnewpass: textheadsetnewpass ?? _textheadsetnewpass,
  edtcurrentpass: edtcurrentpass ?? _edtcurrentpass,
  edtnewpass: edtnewpass ?? _edtnewpass,
  edtcpass: edtcpass ?? _edtcpass,
  btnforgotpass: btnforgotpass ?? _btnforgotpass,
  texpleaseconfirm: texpleaseconfirm ?? _texpleaseconfirm,
  btnconfirm: btnconfirm ?? _btnconfirm,
);
  String? get textheadsetnewpass => _textheadsetnewpass;
  String? get edtcurrentpass => _edtcurrentpass;
  String? get edtnewpass => _edtnewpass;
  String? get edtcpass => _edtcpass;
  String? get btnforgotpass => _btnforgotpass;
  String? get texpleaseconfirm => _texpleaseconfirm;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textheadsetnewpass'] = _textheadsetnewpass;
    map['edtcurrentpass'] = _edtcurrentpass;
    map['edtnewpass'] = _edtnewpass;
    map['edtcpass'] = _edtcpass;
    map['btnforgotpass'] = _btnforgotpass;
    map['texpleaseconfirm'] = _texpleaseconfirm;
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