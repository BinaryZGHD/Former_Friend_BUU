import 'dart:convert';
/// head : {"status":200,"message":"success","module":"home"}
/// body : {"screenInfo":{"screenmore":{"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"},"screenhome":{"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"( Hr : min )","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"Language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}},"pavat_url":"https://math.buu.ac.th/history/frontend/index","luksuit_url":"https://math.buu.ac.th/course/frontend/index","facebook_url":"https://www.facebook.com/SciMathBUU","website_url":"https://math.buu.ac.th/","vs":"1.0.0.0 Beta"}

ScreenHomeResponse screenhomeresponseFromJson(String str) => ScreenHomeResponse.fromJson(json.decode(str));
String screenHomeToJson(ScreenHomeResponse data) => json.encode(data.toJson());
class ScreenHomeResponse {
  ScreenHomeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  ScreenHomeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenHomeResponse copyWith({  Head? head,
    Body? body,
  }) => ScreenHomeResponse(  head: head ?? _head,
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

/// screenInfo : {"titlestatus":"กิจกกรมของฉัน","btnadd":"เพิ่ม","textname":"ชื่อ","textnickname":"ชื่อเล่น","textgen":"รุ่น","textstdcode":"รหัสนิสิต","textemail":"อีเมล","textrole":"ประเภทผู้ใช้งาน","textlang":"ภาษา","textlangdetail":"Thai","textstdtc":"นิสิต","btncpass":"เปลี่ยนรหัสผ่าน","btndelacc":"ลบบัญชีผู้ใช้","textappver":"แอปพลิเคชั่นเวอร์ชั่น","btnlogout":"ออกจากระบบ"}
/// vs : "1.0.0.0 Beta"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    ScreenInfo? screenInfo,
    String? vs,}){
    _screenInfo = screenInfo;
    _vs = vs;
  }

  Body.fromJson(dynamic json) {
    _screenInfo = json['screenInfo'] != null ? ScreenInfo.fromJson(json['screenInfo']) : null;
    _vs = json['vs'];
  }
  ScreenInfo? _screenInfo;
  String? _vs;
  Body copyWith({  ScreenInfo? screenInfo,
    String? vs,
  }) => Body(  screenInfo: screenInfo ?? _screenInfo,
    vs: vs ?? _vs,
  );
  ScreenInfo? get screenInfo => _screenInfo;
  String? get vs => _vs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screenInfo != null) {
      map['screenInfo'] = _screenInfo?.toJson();
    }
    map['vs'] = _vs;
    return map;
  }

}

/// titlestatus : "กิจกกรมของฉัน"
/// btnadd : "เพิ่ม"
/// textname : "ชื่อ"
/// textnickname : "ชื่อเล่น"
/// textgen : "รุ่น"
/// textstdcode : "รหัสนิสิต"
/// textemail : "อีเมล"
/// textrole : "ประเภทผู้ใช้งาน"
/// textlang : "ภาษา"
/// textlangdetail : "Thai"
/// textstdtc : "นิสิต"
/// btncpass : "เปลี่ยนรหัสผ่าน"
/// btndelacc : "ลบบัญชีผู้ใช้"
/// textappver : "แอปพลิเคชั่นเวอร์ชั่น"
/// btnlogout : "ออกจากระบบ"

ScreenInfo screenInfoFromJson(String str) => ScreenInfo.fromJson(json.decode(str));
String screenInfoToJson(ScreenInfo data) => json.encode(data.toJson());
class ScreenInfo {
  ScreenInfo({
    String? titlestatus,
    String? btnadd,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textstdcode,
    String? textemail,
    String? textrole,
    String? textlang,
    String? textlangdetail,
    String? textstdtc,
    String? btncpass,
    String? btndelacc,
    String? textappver,
    String? btnlogout,}){
    _titlestatus = titlestatus;
    _btnadd = btnadd;
    _textname = textname;
    _textnickname = textnickname;
    _textgen = textgen;
    _textstdcode = textstdcode;
    _textemail = textemail;
    _textrole = textrole;
    _textlang = textlang;
    _textlangdetail = textlangdetail;
    _textstdtc = textstdtc;
    _btncpass = btncpass;
    _btndelacc = btndelacc;
    _textappver = textappver;
    _btnlogout = btnlogout;
  }

  ScreenInfo.fromJson(dynamic json) {
    _titlestatus = json['titlestatus'];
    _btnadd = json['btnadd'];
    _textname = json['textname'];
    _textnickname = json['textnickname'];
    _textgen = json['textgen'];
    _textstdcode = json['textstdcode'];
    _textemail = json['textemail'];
    _textrole = json['textrole'];
    _textlang = json['textlang'];
    _textlangdetail = json['textlangdetail'];
    _textstdtc = json['textstdtc'];
    _btncpass = json['btncpass'];
    _btndelacc = json['btndelacc'];
    _textappver = json['textappver'];
    _btnlogout = json['btnlogout'];
  }
  String? _titlestatus;
  String? _btnadd;
  String? _textname;
  String? _textnickname;
  String? _textgen;
  String? _textstdcode;
  String? _textemail;
  String? _textrole;
  String? _textlang;
  String? _textlangdetail;
  String? _textstdtc;
  String? _btncpass;
  String? _btndelacc;
  String? _textappver;
  String? _btnlogout;
  ScreenInfo copyWith({  String? titlestatus,
    String? btnadd,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textstdcode,
    String? textemail,
    String? textrole,
    String? textlang,
    String? textlangdetail,
    String? textstdtc,
    String? btncpass,
    String? btndelacc,
    String? textappver,
    String? btnlogout,
  }) => ScreenInfo(  titlestatus: titlestatus ?? _titlestatus,
    btnadd: btnadd ?? _btnadd,
    textname: textname ?? _textname,
    textnickname: textnickname ?? _textnickname,
    textgen: textgen ?? _textgen,
    textstdcode: textstdcode ?? _textstdcode,
    textemail: textemail ?? _textemail,
    textrole: textrole ?? _textrole,
    textlang: textlang ?? _textlang,
    textlangdetail: textlangdetail ?? _textlangdetail,
    textstdtc: textstdtc ?? _textstdtc,
    btncpass: btncpass ?? _btncpass,
    btndelacc: btndelacc ?? _btndelacc,
    textappver: textappver ?? _textappver,
    btnlogout: btnlogout ?? _btnlogout,
  );
  String? get titlestatus => _titlestatus;
  String? get btnadd => _btnadd;
  String? get textname => _textname;
  String? get textnickname => _textnickname;
  String? get textgen => _textgen;
  String? get textstdcode => _textstdcode;
  String? get textemail => _textemail;
  String? get textrole => _textrole;
  String? get textlang => _textlang;
  String? get textlangdetail => _textlangdetail;
  String? get textstdtc => _textstdtc;
  String? get btncpass => _btncpass;
  String? get btndelacc => _btndelacc;
  String? get textappver => _textappver;
  String? get btnlogout => _btnlogout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlestatus'] = _titlestatus;
    map['btnadd'] = _btnadd;
    map['textname'] = _textname;
    map['textnickname'] = _textnickname;
    map['textgen'] = _textgen;
    map['textstdcode'] = _textstdcode;
    map['textemail'] = _textemail;
    map['textrole'] = _textrole;
    map['textlang'] = _textlang;
    map['textlangdetail'] = _textlangdetail;
    map['textstdtc'] = _textstdtc;
    map['btncpass'] = _btncpass;
    map['btndelacc'] = _btndelacc;
    map['textappver'] = _textappver;
    map['btnlogout'] = _btnlogout;
    return map;
  }

}

/// status : 200
/// message : "success"
/// module : "home"

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