import 'dart:convert';
/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}}

ScreenMoreContactUsResponse screenMoreContactUsResponseFromJson(String str) => ScreenMoreContactUsResponse.fromJson(json.decode(str));
String screenMoreContactUsResponseToJson(ScreenMoreContactUsResponse data) => json.encode(data.toJson());
class ScreenMoreContactUsResponse {
  ScreenMoreContactUsResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenMoreContactUsResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenMoreContactUsResponse copyWith({  Head? head,
  Body? body,
}) => ScreenMoreContactUsResponse(  head: head ?? _head,
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

/// screeninfo : {"texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}

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

/// texturgo2 : "You are going to"
/// textright : "right ?"
/// textyes : "Yes"
/// textno : "No"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? texturgo2, 
      String? textright, 
      String? textyes, 
      String? textno,}){
    _texturgo2 = texturgo2;
    _textright = textright;
    _textyes = textyes;
    _textno = textno;
}

  Screeninfo.fromJson(dynamic json) {
    _texturgo2 = json['texturgo2'];
    _textright = json['textright'];
    _textyes = json['textyes'];
    _textno = json['textno'];
  }
  String? _texturgo2;
  String? _textright;
  String? _textyes;
  String? _textno;
Screeninfo copyWith({  String? texturgo2,
  String? textright,
  String? textyes,
  String? textno,
}) => Screeninfo(  texturgo2: texturgo2 ?? _texturgo2,
  textright: textright ?? _textright,
  textyes: textyes ?? _textyes,
  textno: textno ?? _textno,
);
  String? get texturgo2 => _texturgo2;
  String? get textright => _textright;
  String? get textyes => _textyes;
  String? get textno => _textno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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