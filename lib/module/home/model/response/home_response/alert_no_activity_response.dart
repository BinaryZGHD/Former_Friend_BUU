import 'dart:convert';
/// head : {"status":200,"message":"success","module":"home"}
/// body : {"noactiviry":"ไม่พบกิจกรรมของคุณ","subactlineone":"กดปุ่ม'เพิ่ม'เพื่อบันทึกกิจกรรม","subactlinetwo":"หรือกรุณาตรวจสอบการสถานะกิจกรรมของคุณอีกครั้ง"}

AlertNoActivityResponse alertNoActivityResponseFromJson(String str) => AlertNoActivityResponse.fromJson(json.decode(str));
String alertNoActivityResponseToJson(AlertNoActivityResponse data) => json.encode(data.toJson());
class AlertNoActivityResponse {
  AlertNoActivityResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  AlertNoActivityResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
AlertNoActivityResponse copyWith({  Head? head,
  Body? body,
}) => AlertNoActivityResponse(  head: head ?? _head,
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

/// noactiviry : "ไม่พบกิจกรรมของคุณ"
/// subactlineone : "กดปุ่ม'เพิ่ม'เพื่อบันทึกกิจกรรม"
/// subactlinetwo : "หรือกรุณาตรวจสอบการสถานะกิจกรรมของคุณอีกครั้ง"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? noactiviry, 
      String? subactlineone, 
      String? subactlinetwo,}){
    _noactiviry = noactiviry;
    _subactlineone = subactlineone;
    _subactlinetwo = subactlinetwo;
}

  Body.fromJson(dynamic json) {
    _noactiviry = json['noactiviry'];
    _subactlineone = json['subactlineone'];
    _subactlinetwo = json['subactlinetwo'];
  }
  String? _noactiviry;
  String? _subactlineone;
  String? _subactlinetwo;
Body copyWith({  String? noactiviry,
  String? subactlineone,
  String? subactlinetwo,
}) => Body(  noactiviry: noactiviry ?? _noactiviry,
  subactlineone: subactlineone ?? _subactlineone,
  subactlinetwo: subactlinetwo ?? _subactlinetwo,
);
  String? get noactiviry => _noactiviry;
  String? get subactlineone => _subactlineone;
  String? get subactlinetwo => _subactlinetwo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noactiviry'] = _noactiviry;
    map['subactlineone'] = _subactlineone;
    map['subactlinetwo'] = _subactlinetwo;
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