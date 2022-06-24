import 'dart:convert';
/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"Titleaddact":"Add activity","Titleeditact":"Edit activity","Edtactname":"Activity name / Project name","Edtyear":"Year","Edtterm":"Term","Edtstartdate":"Start date","Edtfinishdate":"Finish date","Edttime":"Total time(Hours)","Edttvenue":"Venue","Edtdetail":"Detail","Btnconfirm":"Confirm"},"yearlist":["2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033"],"termlist":["1","2","summer"],"approverlist":["1李四张三李四三","2李李四李三四李四四","3张三李四李四张三","4李四张三李四三","5李李四李三四李四四","6张三李四李四张三"]}

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

/// screeninfo : {"Titleaddact":"Add activity","Titleeditact":"Edit activity","Edtactname":"Activity name / Project name","Edtyear":"Year","Edtterm":"Term","Edtstartdate":"Start date","Edtfinishdate":"Finish date","Edttime":"Total time(Hours)","Edttvenue":"Venue","Edtdetail":"Detail","Btnconfirm":"Confirm"}
/// yearlist : ["2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033"]
/// termlist : ["1","2","summer"]
/// approverlist : ["1李四张三李四三","2李李四李三四李四四","3张三李四李四张三","4李四张三李四三","5李李四李三四李四四","6张三李四李四张三"]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<String>? yearlist, 
      List<String>? termlist, 
      List<String>? approverlist,}){
    _screeninfo = screeninfo;
    _yearlist = yearlist;
    _termlist = termlist;
    _approverlist = approverlist;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _yearlist = json['yearlist'] != null ? json['yearlist'].cast<String>() : [];
    _termlist = json['termlist'] != null ? json['termlist'].cast<String>() : [];
    _approverlist = json['approverlist'] != null ? json['approverlist'].cast<String>() : [];
  }
  Screeninfo? _screeninfo;
  List<String>? _yearlist;
  List<String>? _termlist;
  List<String>? _approverlist;
Body copyWith({  Screeninfo? screeninfo,
  List<String>? yearlist,
  List<String>? termlist,
  List<String>? approverlist,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  yearlist: yearlist ?? _yearlist,
  termlist: termlist ?? _termlist,
  approverlist: approverlist ?? _approverlist,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<String>? get yearlist => _yearlist;
  List<String>? get termlist => _termlist;
  List<String>? get approverlist => _approverlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    map['yearlist'] = _yearlist;
    map['termlist'] = _termlist;
    map['approverlist'] = _approverlist;
    return map;
  }
}

/// Titleaddact : "Add activity"
/// Titleeditact : "Edit activity"
/// Edtactname : "Activity name / Project name"
/// Edtyear : "Year"
/// Edtterm : "Term"
/// Edtstartdate : "Start date"
/// Edtfinishdate : "Finish date"
/// Edttime : "Total time(Hours)"
/// Edttvenue : "Venue"
/// Edtdetail : "Detail"
/// Btnconfirm : "Confirm"

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
    _titleaddact = json['Titleaddact'];
    _titleeditact = json['Titleeditact'];
    _edtactname = json['Edtactname'];
    _edtyear = json['Edtyear'];
    _edtterm = json['Edtterm'];
    _edtstartdate = json['Edtstartdate'];
    _edtfinishdate = json['Edtfinishdate'];
    _edttime = json['Edttime'];
    _edttvenue = json['Edttvenue'];
    _edtdetail = json['Edtdetail'];
    _btnconfirm = json['Btnconfirm'];
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
    map['Titleaddact'] = _titleaddact;
    map['Titleeditact'] = _titleeditact;
    map['Edtactname'] = _edtactname;
    map['Edtyear'] = _edtyear;
    map['Edtterm'] = _edtterm;
    map['Edtstartdate'] = _edtstartdate;
    map['Edtfinishdate'] = _edtfinishdate;
    map['Edttime'] = _edttime;
    map['Edttvenue'] = _edttvenue;
    map['Edtdetail'] = _edtdetail;
    map['Btnconfirm'] = _btnconfirm;
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
