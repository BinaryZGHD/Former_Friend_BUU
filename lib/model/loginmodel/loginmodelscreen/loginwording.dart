import 'dart:convert';

/// head : {"status":"200","message":"success","modulename":"login"}
/// body : {"screeninfo":{"btnchangelang":"TH / EN","edtID":"Student code / Teacher code","edtpass":"Password","btnlogin":"LOGIN","btnforgotpass":"Forgot password ?","textreg":"Don't have an account ?","btnReg":"Register"}}

LoginWording loginwordingFromJson(String str) => LoginWording.fromJson(json.decode(str));
String loginwordingsToJson(LoginWording data) => json.encode(data.toJson());

class LoginWording {
  LoginWording({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  LoginWording.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  LoginWording copyWith({
    Head? head,
    Body? body,
  }) =>
      LoginWording(
        head: head ?? _head,
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

/// screeninfo : {"btnchangelang":"TH / EN","edtID":"Student code / Teacher code","edtpass":"Password","btnlogin":"LOGIN","btnforgotpass":"Forgot password ?","textreg":"Don't have an account ?","btnReg":"Register"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
  }) {
    _screeninfo = screeninfo;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
  }
  Screeninfo? _screeninfo;
  Body copyWith({
    Screeninfo? screeninfo,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
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

/// btnchangelang : "TH / EN"
/// edtID : "Student code / Teacher code"
/// edtpass : "Password"
/// btnlogin : "LOGIN"
/// btnforgotpass : "Forgot password ?"
/// textreg : "Don't have an account ?"
/// btnReg : "Register"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? btnchangelang,
    String? edtID,
    String? edtpass,
    String? btnlogin,
    String? btnforgotpass,
    String? textreg,
    String? btnReg,
  }) {
    _btnchangelang = btnchangelang;
    _edtID = edtID;
    _edtpass = edtpass;
    _btnlogin = btnlogin;
    _btnforgotpass = btnforgotpass;
    _textreg = textreg;
    _btnReg = btnReg;
  }

  Screeninfo.fromJson(dynamic json) {
    _btnchangelang = json['btnchangelang'];
    _edtID = json['edtID'];
    _edtpass = json['edtpass'];
    _btnlogin = json['btnlogin'];
    _btnforgotpass = json['btnforgotpass'];
    _textreg = json['textreg'];
    _btnReg = json['btnReg'];
  }
  String? _btnchangelang;
  String? _edtID;
  String? _edtpass;
  String? _btnlogin;
  String? _btnforgotpass;
  String? _textreg;
  String? _btnReg;
  Screeninfo copyWith({
    String? btnchangelang,
    String? edtID,
    String? edtpass,
    String? btnlogin,
    String? btnforgotpass,
    String? textreg,
    String? btnReg,
  }) =>
      Screeninfo(
        btnchangelang: btnchangelang ?? _btnchangelang,
        edtID: edtID ?? _edtID,
        edtpass: edtpass ?? _edtpass,
        btnlogin: btnlogin ?? _btnlogin,
        btnforgotpass: btnforgotpass ?? _btnforgotpass,
        textreg: textreg ?? _textreg,
        btnReg: btnReg ?? _btnReg,
      );
  String? get btnchangelang => _btnchangelang;
  String? get edtID => _edtID;
  String? get edtpass => _edtpass;
  String? get btnlogin => _btnlogin;
  String? get btnforgotpass => _btnforgotpass;
  String? get textreg => _textreg;
  String? get btnReg => _btnReg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['btnchangelang'] = _btnchangelang;
    map['edtID'] = _edtID;
    map['edtpass'] = _edtpass;
    map['btnlogin'] = _btnlogin;
    map['btnforgotpass'] = _btnforgotpass;
    map['textreg'] = _textreg;
    map['btnReg'] = _btnReg;
    return map;
  }
}

/// status : "200"
/// message : "success"
/// modulename : "login"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());

class Head {
  Head({
    String? status,
    String? message,
    String? modulename,
  }) {
    _status = status;
    _message = message;
    _modulename = modulename;
  }

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
  }
  String? _status;
  String? _message;
  String? _modulename;
  Head copyWith({
    String? status,
    String? message,
    String? modulename,
  }) =>
      Head(
        status: status ?? _status,
        message: message ?? _message,
        modulename: modulename ?? _modulename,
      );
  String? get status => _status;
  String? get message => _message;
  String? get modulename => _modulename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['modulename'] = _modulename;
    return map;
  }
}
