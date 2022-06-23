import 'dart:convert';
/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"titleaddact":"Add activity","titleeditact":"Edit activity","edtactname":"Activity name / Project name","edtyear":"Year","edtterm":"Term","edtstartdate":"Start date","edtfinishdate":"Finish date","edttime":"Total time(Hours)","edttvenue":"Venue","edtdetail":"Detail","btnconfirm":"Confirm"}}

AddActivityScreenApi addActivityScreenApiFromJson(String str) => AddActivityScreenApi.fromJson(json.decode(str));
String addActivityScreenApiToJson(AddActivityScreenApi data) => json.encode(data.toJson());
class AddActivityScreenApi {
  AddActivityScreenApi({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  AddActivityScreenApi.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
AddActivityScreenApi copyWith({  Head? head,
  Body? body,
}) => AddActivityScreenApi(  head: head ?? _head,
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

/// screeninfo : {"titleaddact":"Add activity","titleeditact":"Edit activity","edtactname":"Activity name / Project name","edtyear":"Year","edtterm":"Term","edtstartdate":"Start date","edtfinishdate":"Finish date","edttime":"Total time(Hours)","edttvenue":"Venue","edtdetail":"Detail","btnconfirm":"Confirm"}

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

/// titleaddact : "Add activity"
/// titleeditact : "Edit activity"
/// edtactname : "Activity name / Project name"
/// edtyear : "Year"
/// edtterm : "Term"
/// edtstartdate : "Start date"
/// edtfinishdate : "Finish date"
/// edttime : "Total time(Hours)"
/// edttvenue : "Venue"
/// edtdetail : "Detail"
/// btnconfirm : "Confirm"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleaddact, 
      String? titleeditact, 
      String? edtactname, 
      String? edtyear, 
      String? edtterm, 
      String? edtstartdate, 
      String? edtfinishdate, 
      String? edttime, 
      String? edttvenue, 
      String? edtdetail, 
      String? btnconfirm,}){
    _titleaddact = titleaddact;
    _titleeditact = titleeditact;
    _edtactname = edtactname;
    _edtyear = edtyear;
    _edtterm = edtterm;
    _edtstartdate = edtstartdate;
    _edtfinishdate = edtfinishdate;
    _edttime = edttime;
    _edttvenue = edttvenue;
    _edtdetail = edtdetail;
    _btnconfirm = btnconfirm;
}

  Screeninfo.fromJson(dynamic json) {
    _titleaddact = json['titleaddact'];
    _titleeditact = json['titleeditact'];
    _edtactname = json['edtactname'];
    _edtyear = json['edtyear'];
    _edtterm = json['edtterm'];
    _edtstartdate = json['edtstartdate'];
    _edtfinishdate = json['edtfinishdate'];
    _edttime = json['edttime'];
    _edttvenue = json['edttvenue'];
    _edtdetail = json['edtdetail'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _titleaddact;
  String? _titleeditact;
  String? _edtactname;
  String? _edtyear;
  String? _edtterm;
  String? _edtstartdate;
  String? _edtfinishdate;
  String? _edttime;
  String? _edttvenue;
  String? _edtdetail;
  String? _btnconfirm;
Screeninfo copyWith({  String? titleaddact,
  String? titleeditact,
  String? edtactname,
  String? edtyear,
  String? edtterm,
  String? edtstartdate,
  String? edtfinishdate,
  String? edttime,
  String? edttvenue,
  String? edtdetail,
  String? btnconfirm,
}) => Screeninfo(  titleaddact: titleaddact ?? _titleaddact,
  titleeditact: titleeditact ?? _titleeditact,
  edtactname: edtactname ?? _edtactname,
  edtyear: edtyear ?? _edtyear,
  edtterm: edtterm ?? _edtterm,
  edtstartdate: edtstartdate ?? _edtstartdate,
  edtfinishdate: edtfinishdate ?? _edtfinishdate,
  edttime: edttime ?? _edttime,
  edttvenue: edttvenue ?? _edttvenue,
  edtdetail: edtdetail ?? _edtdetail,
  btnconfirm: btnconfirm ?? _btnconfirm,
);
  String? get titleaddact => _titleaddact;
  String? get titleeditact => _titleeditact;
  String? get edtactname => _edtactname;
  String? get edtyear => _edtyear;
  String? get edtterm => _edtterm;
  String? get edtstartdate => _edtstartdate;
  String? get edtfinishdate => _edtfinishdate;
  String? get edttime => _edttime;
  String? get edttvenue => _edttvenue;
  String? get edtdetail => _edtdetail;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleaddact'] = _titleaddact;
    map['titleeditact'] = _titleeditact;
    map['edtactname'] = _edtactname;
    map['edtyear'] = _edtyear;
    map['edtterm'] = _edtterm;
    map['edtstartdate'] = _edtstartdate;
    map['edtfinishdate'] = _edtfinishdate;
    map['edttime'] = _edttime;
    map['edttvenue'] = _edttvenue;
    map['edtdetail'] = _edtdetail;
    map['btnconfirm'] = _btnconfirm;
    return map;
  }

}

/// status : "200"
/// message : "success"
/// module : "login"

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