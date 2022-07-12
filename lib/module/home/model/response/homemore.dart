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

/// screenInfo : {"screenmore":{"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"},"screenhome":{"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"( Hr : min )","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"Language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}}
/// pavat_url : "https://math.buu.ac.th/history/frontend/index"
/// luksuit_url : "https://math.buu.ac.th/course/frontend/index"
/// facebook_url : "https://www.facebook.com/SciMathBUU"
/// website_url : "https://math.buu.ac.th/"
/// vs : "1.0.0.0 Beta"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      ScreenInfo? screenInfo, 
      String? pavatUrl, 
      String? luksuitUrl, 
      String? facebookUrl, 
      String? websiteUrl, 
      String? vs,}){
    _screenInfo = screenInfo;
    _pavatUrl = pavatUrl;
    _luksuitUrl = luksuitUrl;
    _facebookUrl = facebookUrl;
    _websiteUrl = websiteUrl;
    _vs = vs;
}

  Body.fromJson(dynamic json) {
    _screenInfo = json['screenInfo'] != null ? ScreenInfo.fromJson(json['screenInfo']) : null;
    _pavatUrl = json['pavat_url'];
    _luksuitUrl = json['luksuit_url'];
    _facebookUrl = json['facebook_url'];
    _websiteUrl = json['website_url'];
    _vs = json['vs'];
  }
  ScreenInfo? _screenInfo;
  String? _pavatUrl;
  String? _luksuitUrl;
  String? _facebookUrl;
  String? _websiteUrl;
  String? _vs;
Body copyWith({  ScreenInfo? screenInfo,
  String? pavatUrl,
  String? luksuitUrl,
  String? facebookUrl,
  String? websiteUrl,
  String? vs,
}) => Body(  screenInfo: screenInfo ?? _screenInfo,
  pavatUrl: pavatUrl ?? _pavatUrl,
  luksuitUrl: luksuitUrl ?? _luksuitUrl,
  facebookUrl: facebookUrl ?? _facebookUrl,
  websiteUrl: websiteUrl ?? _websiteUrl,
  vs: vs ?? _vs,
);
  ScreenInfo? get screenInfo => _screenInfo;
  String? get pavatUrl => _pavatUrl;
  String? get luksuitUrl => _luksuitUrl;
  String? get facebookUrl => _facebookUrl;
  String? get websiteUrl => _websiteUrl;
  String? get vs => _vs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screenInfo != null) {
      map['screenInfo'] = _screenInfo?.toJson();
    }
    map['pavat_url'] = _pavatUrl;
    map['luksuit_url'] = _luksuitUrl;
    map['facebook_url'] = _facebookUrl;
    map['website_url'] = _websiteUrl;
    map['vs'] = _vs;
    return map;
  }

}

/// screenmore : {"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}
/// screenhome : {"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"( Hr : min )","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"Language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}

ScreenInfo screenInfoFromJson(String str) => ScreenInfo.fromJson(json.decode(str));
String screenInfoToJson(ScreenInfo data) => json.encode(data.toJson());
class ScreenInfo {
  ScreenInfo({
      Screenmore? screenmore, 
      Screenhome? screenhome,}){
    _screenmore = screenmore;
    _screenhome = screenhome;
}

  ScreenInfo.fromJson(dynamic json) {
    _screenmore = json['screenmore'] != null ? Screenmore.fromJson(json['screenmore']) : null;
    _screenhome = json['screenhome'] != null ? Screenhome.fromJson(json['screenhome']) : null;
  }
  Screenmore? _screenmore;
  Screenhome? _screenhome;
ScreenInfo copyWith({  Screenmore? screenmore,
  Screenhome? screenhome,
}) => ScreenInfo(  screenmore: screenmore ?? _screenmore,
  screenhome: screenhome ?? _screenhome,
);
  Screenmore? get screenmore => _screenmore;
  Screenhome? get screenhome => _screenhome;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screenmore != null) {
      map['screenmore'] = _screenmore?.toJson();
    }
    if (_screenhome != null) {
      map['screenhome'] = _screenhome?.toJson();
    }
    return map;
  }

}

/// titlestatus : "My activity"
/// textactivity : "Activity name"
/// textyear : "Year"
/// textterm : "Term"
/// textstartdate : "Start date"
/// textfinishdate : "Finish date"
/// texttime : "Total time"
/// texttimestatus : "( Hr : min )"
/// textvenue : "Venue"
/// edtapprover : "Approver"
/// textdetail : "Detail"
/// btnadd : "ADD"
/// textname : "Name"
/// textnickname : "Nickname"
/// textgen : "Gen."
/// textstdcode : "Student code"
/// textemail : "Email"
/// textrole : "Role"
/// textlang : "Language"
/// textlangdetail : "Thai"
/// textstdtc : "Student / Teacher"
/// btncpass : "Change password"
/// btndelacc : "Delete account"
/// textappver : "Application version"
/// btnlogout : "Logout"

Screenhome screenhomeFromJson(String str) => Screenhome.fromJson(json.decode(str));
String screenhomeToJson(Screenhome data) => json.encode(data.toJson());
class Screenhome {
  Screenhome({
      String? titlestatus, 
      String? textactivity, 
      String? textyear, 
      String? textterm, 
      String? textstartdate, 
      String? textfinishdate, 
      String? texttime, 
      String? texttimestatus, 
      String? textvenue, 
      String? edtapprover, 
      String? textdetail, 
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
    _textactivity = textactivity;
    _textyear = textyear;
    _textterm = textterm;
    _textstartdate = textstartdate;
    _textfinishdate = textfinishdate;
    _texttime = texttime;
    _texttimestatus = texttimestatus;
    _textvenue = textvenue;
    _edtapprover = edtapprover;
    _textdetail = textdetail;
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

  Screenhome.fromJson(dynamic json) {
    _titlestatus = json['titlestatus'];
    _textactivity = json['textactivity'];
    _textyear = json['textyear'];
    _textterm = json['textterm'];
    _textstartdate = json['textstartdate'];
    _textfinishdate = json['textfinishdate'];
    _texttime = json['texttime'];
    _texttimestatus = json['texttimestatus'];
    _textvenue = json['textvenue'];
    _edtapprover = json['edtapprover'];
    _textdetail = json['textdetail'];
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
  String? _textactivity;
  String? _textyear;
  String? _textterm;
  String? _textstartdate;
  String? _textfinishdate;
  String? _texttime;
  String? _texttimestatus;
  String? _textvenue;
  String? _edtapprover;
  String? _textdetail;
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
Screenhome copyWith({  String? titlestatus,
  String? textactivity,
  String? textyear,
  String? textterm,
  String? textstartdate,
  String? textfinishdate,
  String? texttime,
  String? texttimestatus,
  String? textvenue,
  String? edtapprover,
  String? textdetail,
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
}) => Screenhome(  titlestatus: titlestatus ?? _titlestatus,
  textactivity: textactivity ?? _textactivity,
  textyear: textyear ?? _textyear,
  textterm: textterm ?? _textterm,
  textstartdate: textstartdate ?? _textstartdate,
  textfinishdate: textfinishdate ?? _textfinishdate,
  texttime: texttime ?? _texttime,
  texttimestatus: texttimestatus ?? _texttimestatus,
  textvenue: textvenue ?? _textvenue,
  edtapprover: edtapprover ?? _edtapprover,
  textdetail: textdetail ?? _textdetail,
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
  String? get textactivity => _textactivity;
  String? get textyear => _textyear;
  String? get textterm => _textterm;
  String? get textstartdate => _textstartdate;
  String? get textfinishdate => _textfinishdate;
  String? get texttime => _texttime;
  String? get texttimestatus => _texttimestatus;
  String? get textvenue => _textvenue;
  String? get edtapprover => _edtapprover;
  String? get textdetail => _textdetail;
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
    map['textactivity'] = _textactivity;
    map['textyear'] = _textyear;
    map['textterm'] = _textterm;
    map['textstartdate'] = _textstartdate;
    map['textfinishdate'] = _textfinishdate;
    map['texttime'] = _texttime;
    map['texttimestatus'] = _texttimestatus;
    map['textvenue'] = _textvenue;
    map['edtapprover'] = _edtapprover;
    map['textdetail'] = _textdetail;
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

/// textmore : "More"
/// textboard : "Board"
/// btnstd : "Student"
/// btntc : "Teacher"
/// textabdepart : "About department"
/// btndeparthis : "Department history"
/// btncou : "Course"
/// btnface : "Facebook"
/// btnweb : "Website"
/// textsup : "Support"
/// btntermandcon : "Terms and conditions"
/// btnfaq : " FAQ"
/// btnconus : " Contact us"
/// texturgo2 : "You are going to"
/// textright : "right ?"
/// textyes : "Yes"
/// textno : "No"

Screenmore screenmoreFromJson(String str) => Screenmore.fromJson(json.decode(str));
String screenmoreToJson(Screenmore data) => json.encode(data.toJson());
class Screenmore {
  Screenmore({
      String? textmore, 
      String? textboard, 
      String? btnstd, 
      String? btntc, 
      String? textabdepart, 
      String? btndeparthis, 
      String? btncou, 
      String? btnface, 
      String? btnweb, 
      String? textsup, 
      String? btntermandcon, 
      String? btnfaq, 
      String? btnconus, 
      String? texturgo2, 
      String? textright, 
      String? textyes, 
      String? textno,}){
    _textmore = textmore;
    _textboard = textboard;
    _btnstd = btnstd;
    _btntc = btntc;
    _textabdepart = textabdepart;
    _btndeparthis = btndeparthis;
    _btncou = btncou;
    _btnface = btnface;
    _btnweb = btnweb;
    _textsup = textsup;
    _btntermandcon = btntermandcon;
    _btnfaq = btnfaq;
    _btnconus = btnconus;
    _texturgo2 = texturgo2;
    _textright = textright;
    _textyes = textyes;
    _textno = textno;
}

  Screenmore.fromJson(dynamic json) {
    _textmore = json['textmore'];
    _textboard = json['textboard'];
    _btnstd = json['btnstd'];
    _btntc = json['btntc'];
    _textabdepart = json['textabdepart'];
    _btndeparthis = json['btndeparthis'];
    _btncou = json['btncou'];
    _btnface = json['btnface'];
    _btnweb = json['btnweb'];
    _textsup = json['textsup'];
    _btntermandcon = json['btntermandcon'];
    _btnfaq = json['btnfaq'];
    _btnconus = json['btnconus'];
    _texturgo2 = json['texturgo2'];
    _textright = json['textright'];
    _textyes = json['textyes'];
    _textno = json['textno'];
  }
  String? _textmore;
  String? _textboard;
  String? _btnstd;
  String? _btntc;
  String? _textabdepart;
  String? _btndeparthis;
  String? _btncou;
  String? _btnface;
  String? _btnweb;
  String? _textsup;
  String? _btntermandcon;
  String? _btnfaq;
  String? _btnconus;
  String? _texturgo2;
  String? _textright;
  String? _textyes;
  String? _textno;
Screenmore copyWith({  String? textmore,
  String? textboard,
  String? btnstd,
  String? btntc,
  String? textabdepart,
  String? btndeparthis,
  String? btncou,
  String? btnface,
  String? btnweb,
  String? textsup,
  String? btntermandcon,
  String? btnfaq,
  String? btnconus,
  String? texturgo2,
  String? textright,
  String? textyes,
  String? textno,
}) => Screenmore(  textmore: textmore ?? _textmore,
  textboard: textboard ?? _textboard,
  btnstd: btnstd ?? _btnstd,
  btntc: btntc ?? _btntc,
  textabdepart: textabdepart ?? _textabdepart,
  btndeparthis: btndeparthis ?? _btndeparthis,
  btncou: btncou ?? _btncou,
  btnface: btnface ?? _btnface,
  btnweb: btnweb ?? _btnweb,
  textsup: textsup ?? _textsup,
  btntermandcon: btntermandcon ?? _btntermandcon,
  btnfaq: btnfaq ?? _btnfaq,
  btnconus: btnconus ?? _btnconus,
  texturgo2: texturgo2 ?? _texturgo2,
  textright: textright ?? _textright,
  textyes: textyes ?? _textyes,
  textno: textno ?? _textno,
);
  String? get textmore => _textmore;
  String? get textboard => _textboard;
  String? get btnstd => _btnstd;
  String? get btntc => _btntc;
  String? get textabdepart => _textabdepart;
  String? get btndeparthis => _btndeparthis;
  String? get btncou => _btncou;
  String? get btnface => _btnface;
  String? get btnweb => _btnweb;
  String? get textsup => _textsup;
  String? get btntermandcon => _btntermandcon;
  String? get btnfaq => _btnfaq;
  String? get btnconus => _btnconus;
  String? get texturgo2 => _texturgo2;
  String? get textright => _textright;
  String? get textyes => _textyes;
  String? get textno => _textno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textmore'] = _textmore;
    map['textboard'] = _textboard;
    map['btnstd'] = _btnstd;
    map['btntc'] = _btntc;
    map['textabdepart'] = _textabdepart;
    map['btndeparthis'] = _btndeparthis;
    map['btncou'] = _btncou;
    map['btnface'] = _btnface;
    map['btnweb'] = _btnweb;
    map['textsup'] = _textsup;
    map['btntermandcon'] = _btntermandcon;
    map['btnfaq'] = _btnfaq;
    map['btnconus'] = _btnconus;
    map['texturgo2'] = _texturgo2;
    map['textright'] = _textright;
    map['textyes'] = _textyes;
    map['textno'] = _textno;
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