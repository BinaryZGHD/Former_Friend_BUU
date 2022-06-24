import 'dart:convert';
/// head : {"status":"200","message":"susccess","module":"Home"}
/// body : {"screeninfo":{"titlestatus":" Approved!  ","textactivity":" Activity name / Project name  ","textyear":" Year  ","textterm":" Term  ","textstartdate":" Start date  ","textfinishdate":" Finish date  ","texttime":" Total time(Hours)  ","textvenue":" Venue  ","edtapprover":" Approver  ","textdetail":" Detail  "},"id":"a1","activity":{"id":"1","name":"Project 1","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room 1","approver":"ชื่อ - นามกุล ","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"}}

ActivityDetailApi activityDetailApiFromJson(String str) => ActivityDetailApi.fromJson(json.decode(str));
String activityDetailApiToJson(ActivityDetailApi data) => json.encode(data.toJson());
class ActivityDetailApi {
  ActivityDetailApi({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ActivityDetailApi.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ActivityDetailApi copyWith({  Head? head,
  Body? body,
}) => ActivityDetailApi(  head: head ?? _head,
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

/// screeninfo : {"titlestatus":" Approved!  ","textactivity":" Activity name / Project name  ","textyear":" Year  ","textterm":" Term  ","textstartdate":" Start date  ","textfinishdate":" Finish date  ","texttime":" Total time(Hours)  ","textvenue":" Venue  ","edtapprover":" Approver  ","textdetail":" Detail  "}
/// id : "a1"
/// activity : {"id":"1","name":"Project 1","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room 1","approver":"ชื่อ - นามกุล ","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      String? id, 
      Activity? activity,}){
    _screeninfo = screeninfo;
    _id = id;
    _activity = activity;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _id = json['id'];
    _activity = json['activity'] != null ? Activity.fromJson(json['activity']) : null;
  }
  Screeninfo? _screeninfo;
  String? _id;
  Activity? _activity;
Body copyWith({  Screeninfo? screeninfo,
  String? id,
  Activity? activity,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  id: id ?? _id,
  activity: activity ?? _activity,
);
  Screeninfo? get screeninfo => _screeninfo;
  String? get id => _id;
  Activity? get activity => _activity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    map['id'] = _id;
    if (_activity != null) {
      map['activity'] = _activity?.toJson();
    }
    return map;
  }

}

/// id : "1"
/// name : "Project 1"
/// year : "2017"
/// term : "1"
/// startdate : "2017-01-01"
/// finishdate : "2017-12-31"
/// time : " 05:30 "
/// venue : "Room 1"
/// approver : "ชื่อ - นามกุล "
/// detail : "Detail 1กิจกรรม "
/// status : "Approved!"
/// color : "#B6FFCE"

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));
String activityToJson(Activity data) => json.encode(data.toJson());
class Activity {
  Activity({
      String? id, 
      String? name, 
      String? year, 
      String? term, 
      String? startdate, 
      String? finishdate, 
      String? time, 
      String? venue, 
      String? approver, 
      String? detail, 
      String? status, 
      String? color,}){
    _id = id;
    _name = name;
    _year = year;
    _term = term;
    _startdate = startdate;
    _finishdate = finishdate;
    _time = time;
    _venue = venue;
    _approver = approver;
    _detail = detail;
    _status = status;
    _color = color;
}

  Activity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _term = json['term'];
    _startdate = json['startdate'];
    _finishdate = json['finishdate'];
    _time = json['time'];
    _venue = json['venue'];
    _approver = json['approver'];
    _detail = json['detail'];
    _status = json['status'];
    _color = json['color'];
  }
  String? _id;
  String? _name;
  String? _year;
  String? _term;
  String? _startdate;
  String? _finishdate;
  String? _time;
  String? _venue;
  String? _approver;
  String? _detail;
  String? _status;
  String? _color;
Activity copyWith({  String? id,
  String? name,
  String? year,
  String? term,
  String? startdate,
  String? finishdate,
  String? time,
  String? venue,
  String? approver,
  String? detail,
  String? status,
  String? color,
}) => Activity(  id: id ?? _id,
  name: name ?? _name,
  year: year ?? _year,
  term: term ?? _term,
  startdate: startdate ?? _startdate,
  finishdate: finishdate ?? _finishdate,
  time: time ?? _time,
  venue: venue ?? _venue,
  approver: approver ?? _approver,
  detail: detail ?? _detail,
  status: status ?? _status,
  color: color ?? _color,
);
  String? get id => _id;
  String? get name => _name;
  String? get year => _year;
  String? get term => _term;
  String? get startdate => _startdate;
  String? get finishdate => _finishdate;
  String? get time => _time;
  String? get venue => _venue;
  String? get approver => _approver;
  String? get detail => _detail;
  String? get status => _status;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['term'] = _term;
    map['startdate'] = _startdate;
    map['finishdate'] = _finishdate;
    map['time'] = _time;
    map['venue'] = _venue;
    map['approver'] = _approver;
    map['detail'] = _detail;
    map['status'] = _status;
    map['color'] = _color;
    return map;
  }

}

/// titlestatus : " Approved!  "
/// textactivity : " Activity name / Project name  "
/// textyear : " Year  "
/// textterm : " Term  "
/// textstartdate : " Start date  "
/// textfinishdate : " Finish date  "
/// texttime : " Total time(Hours)  "
/// textvenue : " Venue  "
/// edtapprover : " Approver  "
/// textdetail : " Detail  "

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titlestatus, 
      String? textactivity, 
      String? textyear, 
      String? textterm, 
      String? textstartdate, 
      String? textfinishdate, 
      String? texttime, 
      String? textvenue, 
      String? edtapprover, 
      String? textdetail,}){
    _titlestatus = titlestatus;
    _textactivity = textactivity;
    _textyear = textyear;
    _textterm = textterm;
    _textstartdate = textstartdate;
    _textfinishdate = textfinishdate;
    _texttime = texttime;
    _textvenue = textvenue;
    _edtapprover = edtapprover;
    _textdetail = textdetail;
}

  Screeninfo.fromJson(dynamic json) {
    _titlestatus = json['titlestatus'];
    _textactivity = json['textactivity'];
    _textyear = json['textyear'];
    _textterm = json['textterm'];
    _textstartdate = json['textstartdate'];
    _textfinishdate = json['textfinishdate'];
    _texttime = json['texttime'];
    _textvenue = json['textvenue'];
    _edtapprover = json['edtapprover'];
    _textdetail = json['textdetail'];
  }
  String? _titlestatus;
  String? _textactivity;
  String? _textyear;
  String? _textterm;
  String? _textstartdate;
  String? _textfinishdate;
  String? _texttime;
  String? _textvenue;
  String? _edtapprover;
  String? _textdetail;
Screeninfo copyWith({  String? titlestatus,
  String? textactivity,
  String? textyear,
  String? textterm,
  String? textstartdate,
  String? textfinishdate,
  String? texttime,
  String? textvenue,
  String? edtapprover,
  String? textdetail,
}) => Screeninfo(  titlestatus: titlestatus ?? _titlestatus,
  textactivity: textactivity ?? _textactivity,
  textyear: textyear ?? _textyear,
  textterm: textterm ?? _textterm,
  textstartdate: textstartdate ?? _textstartdate,
  textfinishdate: textfinishdate ?? _textfinishdate,
  texttime: texttime ?? _texttime,
  textvenue: textvenue ?? _textvenue,
  edtapprover: edtapprover ?? _edtapprover,
  textdetail: textdetail ?? _textdetail,
);
  String? get titlestatus => _titlestatus;
  String? get textactivity => _textactivity;
  String? get textyear => _textyear;
  String? get textterm => _textterm;
  String? get textstartdate => _textstartdate;
  String? get textfinishdate => _textfinishdate;
  String? get texttime => _texttime;
  String? get textvenue => _textvenue;
  String? get edtapprover => _edtapprover;
  String? get textdetail => _textdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlestatus'] = _titlestatus;
    map['textactivity'] = _textactivity;
    map['textyear'] = _textyear;
    map['textterm'] = _textterm;
    map['textstartdate'] = _textstartdate;
    map['textfinishdate'] = _textfinishdate;
    map['texttime'] = _texttime;
    map['textvenue'] = _textvenue;
    map['edtapprover'] = _edtapprover;
    map['textdetail'] = _textdetail;
    return map;
  }

}

/// status : "200"
/// message : "susccess"
/// module : "Home"

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