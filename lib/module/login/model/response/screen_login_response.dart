import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"Home"}
/// body : {"screeninfo":{"btnChangeLang":"TH/EN","imgLogo":"https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png","edtID":"รหัสนิสิต/รหัสอาจารย์","edtPass":"รหัสผ่าน","btnLogin":"เข้าสู่ระบบ","btnForgotPass":"ลืมรหัสผ่าน?","textReg":"ไม่มีบัญชีใช่หรือไม่?","btnReg":"ลงทะเบียน"}}

ScreenLoginResponse screenLoginResponseFromJson(String str) => ScreenLoginResponse.fromJson(json.decode(str));
String screenLoginResponseToJson(ScreenLoginResponse data) => json.encode(data.toJson());
class ScreenLoginResponse {
  ScreenLoginResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  ScreenLoginResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenLoginResponse copyWith({  Head? head,
    Body? body,
  }) => ScreenLoginResponse(  head: head ?? _head,
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

/// screeninfo : {"btnChangeLang":"TH/EN","imgLogo":"https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png","edtID":"รหัสนิสิต/รหัสอาจารย์","edtPass":"รหัสผ่าน","btnLogin":"เข้าสู่ระบบ","btnForgotPass":"ลืมรหัสผ่าน?","textReg":"ไม่มีบัญชีใช่หรือไม่?","btnReg":"ลงทะเบียน"}

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

/// btnChangeLang : "TH/EN"
/// imgLogo : "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png"
/// edtID : "รหัสนิสิต/รหัสอาจารย์"
/// edtPass : "รหัสผ่าน"
/// btnLogin : "เข้าสู่ระบบ"
/// btnForgotPass : "ลืมรหัสผ่าน?"
/// textReg : "ไม่มีบัญชีใช่หรือไม่?"
/// btnReg : "ลงทะเบียน"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? btnChangeLang,
    String? imgLogo,
    String? edtID,
    String? edtPass,
    String? btnLogin,
    String? btnForgotPass,
    String? textReg,
    String? btnReg,}){
    _btnChangeLang = btnChangeLang;
    _imgLogo = imgLogo;
    _edtID = edtID;
    _edtPass = edtPass;
    _btnLogin = btnLogin;
    _btnForgotPass = btnForgotPass;
    _textReg = textReg;
    _btnReg = btnReg;
  }

  Screeninfo.fromJson(dynamic json) {
    _btnChangeLang = json['btnChangeLang'];
    _imgLogo = json['imgLogo'];
    _edtID = json['edtID'];
    _edtPass = json['edtPass'];
    _btnLogin = json['btnLogin'];
    _btnForgotPass = json['btnForgotPass'];
    _textReg = json['textReg'];
    _btnReg = json['btnReg'];
  }
  String? _btnChangeLang;
  String? _imgLogo;
  String? _edtID;
  String? _edtPass;
  String? _btnLogin;
  String? _btnForgotPass;
  String? _textReg;
  String? _btnReg;
  Screeninfo copyWith({  String? btnChangeLang,
    String? imgLogo,
    String? edtID,
    String? edtPass,
    String? btnLogin,
    String? btnForgotPass,
    String? textReg,
    String? btnReg,
  }) => Screeninfo(  btnChangeLang: btnChangeLang ?? _btnChangeLang,
    imgLogo: imgLogo ?? _imgLogo,
    edtID: edtID ?? _edtID,
    edtPass: edtPass ?? _edtPass,
    btnLogin: btnLogin ?? _btnLogin,
    btnForgotPass: btnForgotPass ?? _btnForgotPass,
    textReg: textReg ?? _textReg,
    btnReg: btnReg ?? _btnReg,
  );
  String? get btnChangeLang => _btnChangeLang;
  String? get imgLogo => _imgLogo;
  String? get edtID => _edtID;
  String? get edtPass => _edtPass;
  String? get btnLogin => _btnLogin;
  String? get btnForgotPass => _btnForgotPass;
  String? get textReg => _textReg;
  String? get btnReg => _btnReg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['btnChangeLang'] = _btnChangeLang;
    map['imgLogo'] = _imgLogo;
    map['edtID'] = _edtID;
    map['edtPass'] = _edtPass;
    map['btnLogin'] = _btnLogin;
    map['btnForgotPass'] = _btnForgotPass;
    map['textReg'] = _textReg;
    map['btnReg'] = _btnReg;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "Home"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
    int? status,
    String? message,
    String? modulename,}){
    _status = status;
    _message = message;
    _modulename = modulename;
  }

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
  }
  int? _status;
  String? _message;
  String? _modulename;
  Head copyWith({  int? status,
    String? message,
    String? modulename,
  }) => Head(  status: status ?? _status,
    message: message ?? _message,
    modulename: modulename ?? _modulename,
  );
  int? get status => _status;
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