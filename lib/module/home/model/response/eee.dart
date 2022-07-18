import 'dart:convert';
/// head : {"status":200,"message":"success","module":"home"}
/// body : {"deletealert":"คุณต้องลบบัญชีใช่หรือไม่","subdeletalert":"หากคุณต้องการลบบัญชีผู้ใช้ ให้กดปุ่ม 'ตกลง' หรือกดปุ่ม 'ยกเลิก' เพื่อกลับไปใช้งาน หากคุณพบปัญหาโปรดติดต่อเรา","emaideletelalert":"f2f.scibuu@staff.buu.ac.th","phonedeletealert":"+66-81-898-898-8","cancel":"ยกเลิก","ok":"ตกลง","confirm":"ยืนยัน","no":"ไม่ใช่","yes":"ใช่","apccrpt":"ยินยอม","Decline":"ปฏิเสธ","close":"ปิด"}

Eee eeeFromJson(String str) => Eee.fromJson(json.decode(str));
String eeeToJson(Eee data) => json.encode(data.toJson());
class Eee {
  Eee({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  Eee.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
Eee copyWith({  Head? head,
  Body? body,
}) => Eee(  head: head ?? _head,
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

/// deletealert : "คุณต้องลบบัญชีใช่หรือไม่"
/// subdeletalert : "หากคุณต้องการลบบัญชีผู้ใช้ ให้กดปุ่ม 'ตกลง' หรือกดปุ่ม 'ยกเลิก' เพื่อกลับไปใช้งาน หากคุณพบปัญหาโปรดติดต่อเรา"
/// emaideletelalert : "f2f.scibuu@staff.buu.ac.th"
/// phonedeletealert : "+66-81-898-898-8"
/// cancel : "ยกเลิก"
/// ok : "ตกลง"
/// confirm : "ยืนยัน"
/// no : "ไม่ใช่"
/// yes : "ใช่"
/// apccrpt : "ยินยอม"
/// Decline : "ปฏิเสธ"
/// close : "ปิด"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? deletealert, 
      String? subdeletalert, 
      String? emaideletelalert, 
      String? phonedeletealert, 
      String? cancel, 
      String? ok, 
      String? confirm, 
      String? no, 
      String? yes, 
      String? apccrpt, 
      String? decline, 
      String? close,}){
    _deletealert = deletealert;
    _subdeletalert = subdeletalert;
    _emaideletelalert = emaideletelalert;
    _phonedeletealert = phonedeletealert;
    _cancel = cancel;
    _ok = ok;
    _confirm = confirm;
    _no = no;
    _yes = yes;
    _apccrpt = apccrpt;
    _decline = decline;
    _close = close;
}

  Body.fromJson(dynamic json) {
    _deletealert = json['deletealert'];
    _subdeletalert = json['subdeletalert'];
    _emaideletelalert = json['emaideletelalert'];
    _phonedeletealert = json['phonedeletealert'];
    _cancel = json['cancel'];
    _ok = json['ok'];
    _confirm = json['confirm'];
    _no = json['no'];
    _yes = json['yes'];
    _apccrpt = json['apccrpt'];
    _decline = json['Decline'];
    _close = json['close'];
  }
  String? _deletealert;
  String? _subdeletalert;
  String? _emaideletelalert;
  String? _phonedeletealert;
  String? _cancel;
  String? _ok;
  String? _confirm;
  String? _no;
  String? _yes;
  String? _apccrpt;
  String? _decline;
  String? _close;
Body copyWith({  String? deletealert,
  String? subdeletalert,
  String? emaideletelalert,
  String? phonedeletealert,
  String? cancel,
  String? ok,
  String? confirm,
  String? no,
  String? yes,
  String? apccrpt,
  String? decline,
  String? close,
}) => Body(  deletealert: deletealert ?? _deletealert,
  subdeletalert: subdeletalert ?? _subdeletalert,
  emaideletelalert: emaideletelalert ?? _emaideletelalert,
  phonedeletealert: phonedeletealert ?? _phonedeletealert,
  cancel: cancel ?? _cancel,
  ok: ok ?? _ok,
  confirm: confirm ?? _confirm,
  no: no ?? _no,
  yes: yes ?? _yes,
  apccrpt: apccrpt ?? _apccrpt,
  decline: decline ?? _decline,
  close: close ?? _close,
);
  String? get deletealert => _deletealert;
  String? get subdeletalert => _subdeletalert;
  String? get emaideletelalert => _emaideletelalert;
  String? get phonedeletealert => _phonedeletealert;
  String? get cancel => _cancel;
  String? get ok => _ok;
  String? get confirm => _confirm;
  String? get no => _no;
  String? get yes => _yes;
  String? get apccrpt => _apccrpt;
  String? get decline => _decline;
  String? get close => _close;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deletealert'] = _deletealert;
    map['subdeletalert'] = _subdeletalert;
    map['emaideletelalert'] = _emaideletelalert;
    map['phonedeletealert'] = _phonedeletealert;
    map['cancel'] = _cancel;
    map['ok'] = _ok;
    map['confirm'] = _confirm;
    map['no'] = _no;
    map['yes'] = _yes;
    map['apccrpt'] = _apccrpt;
    map['Decline'] = _decline;
    map['close'] = _close;
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