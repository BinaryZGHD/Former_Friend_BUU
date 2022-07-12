import 'dart:convert';

/// head : {"status":200,"message":"success","module":"login"}
/// body : {"screeninfo":{"textPDPAhead":"Terms of service and Privacy policy","btnaccept":"Accept","btndecline":"Decline"},"linkpdpa":"http://www.ratchakitcha.soc.go.th/DATA/PDF/2562/A/069/T_0052.PDF"}

ScreenPDPAResponse ScreenPDPAResponseFromJson(String str) => ScreenPDPAResponse.fromJson(json.decode(str));
String pdpawordingToJson(ScreenPDPAResponse data) => json.encode(data.toJson());

class ScreenPDPAResponse {
  ScreenPDPAResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenPDPAResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenPDPAResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenPDPAResponse(
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

/// screeninfo : {"textPDPAhead":"Terms of service and Privacy policy","btnaccept":"Accept","btndecline":"Decline"}
/// linkpdpa : "http://www.ratchakitcha.soc.go.th/DATA/PDF/2562/A/069/T_0052.PDF"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    String? linkpdpa,
  }) {
    _screeninfo = screeninfo;
    _linkpdpa = linkpdpa;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _linkpdpa = json['linkpdpa'];
  }
  Screeninfo? _screeninfo;
  String? _linkpdpa;
  Body copyWith({
    Screeninfo? screeninfo,
    String? linkpdpa,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        linkpdpa: linkpdpa ?? _linkpdpa,
      );
  Screeninfo? get screeninfo => _screeninfo;
  String? get linkpdpa => _linkpdpa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    map['linkpdpa'] = _linkpdpa;
    return map;
  }
}

/// textPDPAhead : "Terms of service and Privacy policy"
/// btnaccept : "Accept"
/// btndecline : "Decline"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlepdpa,
    String? btnaccept,
    String? btndecline,}){
    _titlepdpa = titlepdpa;
    _btnaccept = btnaccept;
    _btndecline = btndecline;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlepdpa = json['titlepdpa'];
    _btnaccept = json['btnaccept'];
    _btndecline = json['btndecline'];
  }
  String? _titlepdpa;
  String? _btnaccept;
  String? _btndecline;
  Screeninfo copyWith({  String? titlepdpa,
    String? btnaccept,
    String? btndecline,
  }) => Screeninfo(  titlepdpa: titlepdpa ?? _titlepdpa,
    btnaccept: btnaccept ?? _btnaccept,
    btndecline: btndecline ?? _btndecline,
  );
  String? get titlepdpa => _titlepdpa;
  String? get btnaccept => _btnaccept;
  String? get btndecline => _btndecline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlepdpa'] = _titlepdpa;
    map['btnaccept'] = _btnaccept;
    map['btndecline'] = _btndecline;
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