import 'dart:convert';
/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"},"pavat_url":"http://math.buu.ac.th/history/frontend/index","luksuit_url":"http://math.buu.ac.th/course/frontend/index","facebook_url":"https://www.facebook.com/SciMathBUU","website_url":"http://math.buu.ac.th/"}

ScreenHomeMoreResponse screenhomemoreResponseFromJson(String str) => ScreenHomeMoreResponse.fromJson(json.decode(str));
String homemorewordingToJson(ScreenHomeMoreResponse data) => json.encode(data.toJson());
class ScreenHomeMoreResponse {
  ScreenHomeMoreResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenHomeMoreResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenHomeMoreResponse copyWith({  Head? head,
  Body? body,
}) => ScreenHomeMoreResponse(  head: head ?? _head,
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

/// screeninfo : {"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}
/// pavat_url : "http://math.buu.ac.th/history/frontend/index"
/// luksuit_url : "http://math.buu.ac.th/course/frontend/index"
/// facebook_url : "https://www.facebook.com/SciMathBUU"
/// website_url : "http://math.buu.ac.th/"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      String? pavatUrl, 
      String? luksuitUrl, 
      String? facebookUrl, 
      String? websiteUrl,}){
    _screeninfo = screeninfo;
    _pavatUrl = pavatUrl;
    _luksuitUrl = luksuitUrl;
    _facebookUrl = facebookUrl;
    _websiteUrl = websiteUrl;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _pavatUrl = json['pavat_url'];
    _luksuitUrl = json['luksuit_url'];
    _facebookUrl = json['facebook_url'];
    _websiteUrl = json['website_url'];
  }
  Screeninfo? _screeninfo;
  String? _pavatUrl;
  String? _luksuitUrl;
  String? _facebookUrl;
  String? _websiteUrl;
Body copyWith({  Screeninfo? screeninfo,
  String? pavatUrl,
  String? luksuitUrl,
  String? facebookUrl,
  String? websiteUrl,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  pavatUrl: pavatUrl ?? _pavatUrl,
  luksuitUrl: luksuitUrl ?? _luksuitUrl,
  facebookUrl: facebookUrl ?? _facebookUrl,
  websiteUrl: websiteUrl ?? _websiteUrl,
);
  Screeninfo? get screeninfo => _screeninfo;
  String? get pavatUrl => _pavatUrl;
  String? get luksuitUrl => _luksuitUrl;
  String? get facebookUrl => _facebookUrl;
  String? get websiteUrl => _websiteUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    map['pavat_url'] = _pavatUrl;
    map['luksuit_url'] = _luksuitUrl;
    map['facebook_url'] = _facebookUrl;
    map['website_url'] = _websiteUrl;
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

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
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

  Screeninfo.fromJson(dynamic json) {
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
Screeninfo copyWith({  String? textmore,
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
}) => Screeninfo(  textmore: textmore ?? _textmore,
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

/// status : "200"
/// message : "success"
/// module : "home"

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