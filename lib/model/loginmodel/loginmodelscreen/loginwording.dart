import 'dart:convert';
/// head : {"status":"200","message":"OK susccess","module":"Login"}
/// body : {"screeninfo":{"Parameter":" EN  ","Btnchangelang":" TH /EN  ","EdtID":" Student code / Teacher code  ","Edtpass":" Password  ","Btnlogin":" LOGIN  ","Btnforgotpass":" Forgot password ?  ","Textreg":" Don’t have an account ?  ","BtnReg":" Register  "}}

Loginwording loginwordingFromJson(String str) => Loginwording.fromJson(json.decode(str));
String loginwordingToJson(Loginwording data) => json.encode(data.toJson());
class Loginwording {
  Loginwording({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  Loginwording.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
Loginwording copyWith({  Head? head,
  Body? body,
}) => Loginwording(  head: head ?? _head,
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

/// screeninfo : {"Parameter":" EN  ","Btnchangelang":" TH /EN  ","EdtID":" Student code / Teacher code  ","Edtpass":" Password  ","Btnlogin":" LOGIN  ","Btnforgotpass":" Forgot password ?  ","Textreg":" Don’t have an account ?  ","BtnReg":" Register  "}

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

/// Parameter : " EN  "
/// Btnchangelang : " TH /EN  "
/// EdtID : " Student code / Teacher code  "
/// Edtpass : " Password  "
/// Btnlogin : " LOGIN  "
/// Btnforgotpass : " Forgot password ?  "
/// Textreg : " Don’t have an account ?  "
/// BtnReg : " Register  "

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? parameter, 
      String? btnchangelang, 
      String? edtID, 
      String? edtpass, 
      String? btnlogin, 
      String? btnforgotpass, 
      String? textreg, 
      String? btnReg,}){
    _parameter = parameter;
    _btnchangelang = btnchangelang;
    _edtID = edtID;
    _edtpass = edtpass;
    _btnlogin = btnlogin;
    _btnforgotpass = btnforgotpass;
    _textreg = textreg;
    _btnReg = btnReg;
}

  Screeninfo.fromJson(dynamic json) {
    _parameter = json['Parameter'];
    _btnchangelang = json['Btnchangelang'];
    _edtID = json['EdtID'];
    _edtpass = json['Edtpass'];
    _btnlogin = json['Btnlogin'];
    _btnforgotpass = json['Btnforgotpass'];
    _textreg = json['Textreg'];
    _btnReg = json['BtnReg'];
  }
  String? _parameter;
  String? _btnchangelang;
  String? _edtID;
  String? _edtpass;
  String? _btnlogin;
  String? _btnforgotpass;
  String? _textreg;
  String? _btnReg;
Screeninfo copyWith({  String? parameter,
  String? btnchangelang,
  String? edtID,
  String? edtpass,
  String? btnlogin,
  String? btnforgotpass,
  String? textreg,
  String? btnReg,
}) => Screeninfo(  parameter: parameter ?? _parameter,
  btnchangelang: btnchangelang ?? _btnchangelang,
  edtID: edtID ?? _edtID,
  edtpass: edtpass ?? _edtpass,
  btnlogin: btnlogin ?? _btnlogin,
  btnforgotpass: btnforgotpass ?? _btnforgotpass,
  textreg: textreg ?? _textreg,
  btnReg: btnReg ?? _btnReg,
);
  String? get parameter => _parameter;
  String? get btnchangelang => _btnchangelang;
  String? get edtID => _edtID;
  String? get edtpass => _edtpass;
  String? get btnlogin => _btnlogin;
  String? get btnforgotpass => _btnforgotpass;
  String? get textreg => _textreg;
  String? get btnReg => _btnReg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Parameter'] = _parameter;
    map['Btnchangelang'] = _btnchangelang;
    map['EdtID'] = _edtID;
    map['Edtpass'] = _edtpass;
    map['Btnlogin'] = _btnlogin;
    map['Btnforgotpass'] = _btnforgotpass;
    map['Textreg'] = _textreg;
    map['BtnReg'] = _btnReg;
    return map;
  }

}

/// status : "200"
/// message : "OK susccess"
/// module : "Login"

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