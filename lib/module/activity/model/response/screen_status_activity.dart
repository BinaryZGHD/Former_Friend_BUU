import 'dart:convert';
/// head : {"status":"200","message":"susccess","module":"Activity"}
/// body : {"screeninfo":{"titlestatusApproved":"Approved!","titlestatusUnapproved":"Unapproved!","titlestatusRejected":"Rejected!","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"(Hours : Minutes)","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","buttonleft":"Edit","buttonright":"Delete"},"activity":[{"id":"1","name":"5555โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room ITC513","approver":"จิรทีปต์ - รุ่งเรืองตลอดกาลนาน","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"},{"id":"2","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"RoomSD9546","approver":"ณัฐปคัลภ์ - ปราชญ์ผู้องอาจ","detail":"Detail 1กิจกรรมโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน ","status":"Rejected!","color":"#FFCECE"},{"id":"3","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room CL101","approver":"อิงครัต – ผู้ยินดีในความรู้","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง ","status":"Unapproved!","color":"#FAFFBE"},{"id":"4","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SVT546","approver":"จิรัฎฐ์ - ดำรงมั่น อยู่นาน","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล ","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"โครงการพัฒนาระบบบริหารสถานศึกษา","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC652","approver":"ฐิตธีร์ - ปราชญ์ผุ้มั่นคง","detail":"Detail กิจกรรม ","status":"Unapproved!","color":"#FAFFBE"},{"id":"6","name":"โครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC302","approver":"อุกฤษฎ์ - ประเสริฐสุด","detail":"Detail 2 กิจกรรมโครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล ","status":"Rejected!","color":"#FFCECE"}]}

ScreenStatusActivityResponse   screenStatusActivityResponseFromJson(String str) => ScreenStatusActivityResponse.fromJson(json.decode(str));
String screenStatusActivityToJson(ScreenStatusActivityResponse data) => json.encode(data.toJson());
class ScreenStatusActivityResponse {
  ScreenStatusActivityResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenStatusActivityResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenStatusActivityResponse copyWith({  Head? head,
  Body? body,
}) => ScreenStatusActivityResponse(  head: head ?? _head,
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

/// screeninfo : {"titlestatusApproved":"Approved!","titlestatusUnapproved":"Unapproved!","titlestatusRejected":"Rejected!","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"(Hours : Minutes)","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","buttonleft":"Edit","buttonright":"Delete"}
/// activity : [{"id":"1","name":"5555โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room ITC513","approver":"จิรทีปต์ - รุ่งเรืองตลอดกาลนาน","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"},{"id":"2","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"RoomSD9546","approver":"ณัฐปคัลภ์ - ปราชญ์ผู้องอาจ","detail":"Detail 1กิจกรรมโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน ","status":"Rejected!","color":"#FFCECE"},{"id":"3","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room CL101","approver":"อิงครัต – ผู้ยินดีในความรู้","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง ","status":"Unapproved!","color":"#FAFFBE"},{"id":"4","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SVT546","approver":"จิรัฎฐ์ - ดำรงมั่น อยู่นาน","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล ","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"โครงการพัฒนาระบบบริหารสถานศึกษา","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC652","approver":"ฐิตธีร์ - ปราชญ์ผุ้มั่นคง","detail":"Detail กิจกรรม ","status":"Unapproved!","color":"#FAFFBE"},{"id":"6","name":"โครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC302","approver":"อุกฤษฎ์ - ประเสริฐสุด","detail":"Detail 2 กิจกรรมโครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล ","status":"Rejected!","color":"#FFCECE"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Activity>? activity,}){
    _screeninfo = screeninfo;
    _activity = activity;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['activity'] != null) {
      _activity = [];
      json['activity'].forEach((v) {
        _activity?.add(Activity.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Activity>? _activity;
Body copyWith({  Screeninfo? screeninfo,
  List<Activity>? activity,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  activity: activity ?? _activity,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Activity>? get activity => _activity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_activity != null) {
      map['activity'] = _activity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// name : "5555โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน"
/// year : "2017"
/// term : "1"
/// startdate : "2017-01-01"
/// finishdate : "2017-12-31"
/// time : " 05:30 "
/// venue : "Room ITC513"
/// approver : "จิรทีปต์ - รุ่งเรืองตลอดกาลนาน"
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

/// titlestatusApproved : "Approved!"
/// titlestatusUnapproved : "Unapproved!"
/// titlestatusRejected : "Rejected!"
/// textactivity : "Activity name"
/// textyear : "Year"
/// textterm : "Term"
/// textstartdate : "Start date"
/// textfinishdate : "Finish date"
/// texttime : "Total time"
/// texttimestatus : "(Hours : Minutes)"
/// textvenue : "Venue"
/// edtapprover : "Approver"
/// textdetail : "Detail"
/// buttonleft : "Edit"
/// buttonright : "Delete"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titlestatusApproved, 
      String? titlestatusUnapproved, 
      String? titlestatusRejected, 
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
      String? buttonleft, 
      String? buttonright,}){
    _titlestatusApproved = titlestatusApproved;
    _titlestatusUnapproved = titlestatusUnapproved;
    _titlestatusRejected = titlestatusRejected;
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
    _buttonleft = buttonleft;
    _buttonright = buttonright;
}

  Screeninfo.fromJson(dynamic json) {
    _titlestatusApproved = json['titlestatusApproved'];
    _titlestatusUnapproved = json['titlestatusUnapproved'];
    _titlestatusRejected = json['titlestatusRejected'];
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
    _buttonleft = json['buttonleft'];
    _buttonright = json['buttonright'];
  }
  String? _titlestatusApproved;
  String? _titlestatusUnapproved;
  String? _titlestatusRejected;
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
  String? _buttonleft;
  String? _buttonright;
Screeninfo copyWith({  String? titlestatusApproved,
  String? titlestatusUnapproved,
  String? titlestatusRejected,
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
  String? buttonleft,
  String? buttonright,
}) => Screeninfo(  titlestatusApproved: titlestatusApproved ?? _titlestatusApproved,
  titlestatusUnapproved: titlestatusUnapproved ?? _titlestatusUnapproved,
  titlestatusRejected: titlestatusRejected ?? _titlestatusRejected,
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
  buttonleft: buttonleft ?? _buttonleft,
  buttonright: buttonright ?? _buttonright,
);
  String? get titlestatusApproved => _titlestatusApproved;
  String? get titlestatusUnapproved => _titlestatusUnapproved;
  String? get titlestatusRejected => _titlestatusRejected;
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
  String? get buttonleft => _buttonleft;
  String? get buttonright => _buttonright;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlestatusApproved'] = _titlestatusApproved;
    map['titlestatusUnapproved'] = _titlestatusUnapproved;
    map['titlestatusRejected'] = _titlestatusRejected;
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
    map['buttonleft'] = _buttonleft;
    map['buttonright'] = _buttonright;
    return map;
  }

}

/// status : "200"
/// message : "susccess"
/// module : "Activity"

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