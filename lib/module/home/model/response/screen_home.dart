import 'dart:convert';
/// head : {"status":"200","message":"susccess","module":"Home"}
/// body : {"screeninfo":{"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"(Hours : minutes)","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"},"data_list_activity":[{"id":"1","name":" โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room ITC513","approver":"จิรทีปต์ - รุ่งเรืองตลอดกาลนาน","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"},{"id":"2","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"RoomSD9546","approver":"ณัฐปคัลภ์ - ปราชญ์ผู้องอาจ","detail":"Detail 1กิจกรรมโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน ","status":"Rejected!","color":"#FFCECE"},{"id":"3","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room CL101","approver":"อิงครัต – ผู้ยินดีในความรู้","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง ","status":"Unapproved!","color":"#FAFFBE"},{"id":"4","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SVT546","approver":"จิรัฎฐ์ - ดำรงมั่น อยู่นาน","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล ","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"โครงการพัฒนาระบบบริหารสถานศึกษา","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC652","approver":"ฐิตธีร์ - ปราชญ์ผุ้มั่นคง","detail":"Detail กิจกรรม ","status":"Unapproved!","color":"#FAFFBE"},{"id":"6","name":"โครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC302","approver":"อุกฤษฎ์ - ประเสริฐสุด","detail":"Detail 2 กิจกรรมโครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล ","status":"Rejected!","color":"#FFCECE"}],"data_drawer_detail":{"name":"นายคณิศาสตร์ สถิติวิชาการ","nickname":"AKA คำฝอย","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj","vs":"1.0.0.0 Beta"}}

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

/// screeninfo : {"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"(Hours : minutes)","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}
/// data_list_activity : [{"id":"1","name":" โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room ITC513","approver":"จิรทีปต์ - รุ่งเรืองตลอดกาลนาน","detail":"Detail 1กิจกรรม ","status":"Approved!","color":"#B6FFCE"},{"id":"2","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"RoomSD9546","approver":"ณัฐปคัลภ์ - ปราชญ์ผู้องอาจ","detail":"Detail 1กิจกรรมโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน ","status":"Rejected!","color":"#FFCECE"},{"id":"3","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room CL101","approver":"อิงครัต – ผู้ยินดีในความรู้","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง ","status":"Unapproved!","color":"#FAFFBE"},{"id":"4","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SVT546","approver":"จิรัฎฐ์ - ดำรงมั่น อยู่นาน","detail":"Detail 1กิจกรรมโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล ","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"โครงการพัฒนาระบบบริหารสถานศึกษา","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC652","approver":"ฐิตธีร์ - ปราชญ์ผุ้มั่นคง","detail":"Detail กิจกรรม ","status":"Unapproved!","color":"#FAFFBE"},{"id":"6","name":"โครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล","year":"2017","term":"1","startdate":"2017-01-01","finishdate":"2017-12-31","time":" 05:30 ","venue":"Room SC302","approver":"อุกฤษฎ์ - ประเสริฐสุด","detail":"Detail 2 กิจกรรมโครงการพัฒนาครูให้ปฏิบัติงานตามบทบาทหน้าที่อย่างมีประสิทธิภาพและเกิดประสิทธิผล ","status":"Rejected!","color":"#FFCECE"}]
/// data_drawer_detail : {"name":"นายคณิศาสตร์ สถิติวิชาการ","nickname":"AKA คำฝอย","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj","vs":"1.0.0.0 Beta"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<DataListActivity>? dataListActivity, 
      DataDrawerDetail? dataDrawerDetail,}){
    _screeninfo = screeninfo;
    _dataListActivity = dataListActivity;
    _dataDrawerDetail = dataDrawerDetail;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['data_list_activity'] != null) {
      _dataListActivity = [];
      json['data_list_activity'].forEach((v) {
        _dataListActivity?.add(DataListActivity.fromJson(v));
      });
    }
    _dataDrawerDetail = json['data_drawer_detail'] != null ? DataDrawerDetail.fromJson(json['data_drawer_detail']) : null;
  }
  Screeninfo? _screeninfo;
  List<DataListActivity>? _dataListActivity;
  DataDrawerDetail? _dataDrawerDetail;
Body copyWith({  Screeninfo? screeninfo,
  List<DataListActivity>? dataListActivity,
  DataDrawerDetail? dataDrawerDetail,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  dataListActivity: dataListActivity ?? _dataListActivity,
  dataDrawerDetail: dataDrawerDetail ?? _dataDrawerDetail,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<DataListActivity>? get dataListActivity => _dataListActivity;
  DataDrawerDetail? get dataDrawerDetail => _dataDrawerDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_dataListActivity != null) {
      map['data_list_activity'] = _dataListActivity?.map((v) => v.toJson()).toList();
    }
    if (_dataDrawerDetail != null) {
      map['data_drawer_detail'] = _dataDrawerDetail?.toJson();
    }
    return map;
  }

}

/// name : "นายคณิศาสตร์ สถิติวิชาการ"
/// nickname : "AKA คำฝอย"
/// gen : "X6"
/// genname : "กรีนทีมัทฉะลาเต้"
/// gencolor : "#9ED9C5"
/// studentid : "6203XXXXX"
/// email : "StudentCodeID@morebuu.ac.th"
/// role : "Student"
/// img : "https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"
/// vs : "1.0.0.0 Beta"

DataDrawerDetail dataDrawerDetailFromJson(String str) => DataDrawerDetail.fromJson(json.decode(str));
String dataDrawerDetailToJson(DataDrawerDetail data) => json.encode(data.toJson());
class DataDrawerDetail {
  DataDrawerDetail({
      String? name, 
      String? nickname, 
      String? gen, 
      String? genname, 
      String? gencolor, 
      String? studentid, 
      String? email, 
      String? role, 
      String? img, 
      String? vs,}){
    _name = name;
    _nickname = nickname;
    _gen = gen;
    _genname = genname;
    _gencolor = gencolor;
    _studentid = studentid;
    _email = email;
    _role = role;
    _img = img;
    _vs = vs;
}

  DataDrawerDetail.fromJson(dynamic json) {
    _name = json['name'];
    _nickname = json['nickname'];
    _gen = json['gen'];
    _genname = json['genname'];
    _gencolor = json['gencolor'];
    _studentid = json['studentid'];
    _email = json['email'];
    _role = json['role'];
    _img = json['img'];
    _vs = json['vs'];
  }
  String? _name;
  String? _nickname;
  String? _gen;
  String? _genname;
  String? _gencolor;
  String? _studentid;
  String? _email;
  String? _role;
  String? _img;
  String? _vs;
DataDrawerDetail copyWith({  String? name,
  String? nickname,
  String? gen,
  String? genname,
  String? gencolor,
  String? studentid,
  String? email,
  String? role,
  String? img,
  String? vs,
}) => DataDrawerDetail(  name: name ?? _name,
  nickname: nickname ?? _nickname,
  gen: gen ?? _gen,
  genname: genname ?? _genname,
  gencolor: gencolor ?? _gencolor,
  studentid: studentid ?? _studentid,
  email: email ?? _email,
  role: role ?? _role,
  img: img ?? _img,
  vs: vs ?? _vs,
);
  String? get name => _name;
  String? get nickname => _nickname;
  String? get gen => _gen;
  String? get genname => _genname;
  String? get gencolor => _gencolor;
  String? get studentid => _studentid;
  String? get email => _email;
  String? get role => _role;
  String? get img => _img;
  String? get vs => _vs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['nickname'] = _nickname;
    map['gen'] = _gen;
    map['genname'] = _genname;
    map['gencolor'] = _gencolor;
    map['studentid'] = _studentid;
    map['email'] = _email;
    map['role'] = _role;
    map['img'] = _img;
    map['vs'] = _vs;
    return map;
  }

}

/// id : "1"
/// name : " โครงการส่งเสริมสุขภาวะที่ดีและมีสุนทรียภาพของผู้เรียน"
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

DataListActivity dataListActivityFromJson(String str) => DataListActivity.fromJson(json.decode(str));
String dataListActivityToJson(DataListActivity data) => json.encode(data.toJson());
class DataListActivity {
  DataListActivity({
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

  DataListActivity.fromJson(dynamic json) {
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
DataListActivity copyWith({  String? id,
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
}) => DataListActivity(  id: id ?? _id,
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

/// titlestatus : "My activity"
/// textactivity : "Activity name"
/// textyear : "Year"
/// textterm : "Term"
/// textstartdate : "Start date"
/// textfinishdate : "Finish date"
/// texttime : "Total time"
/// texttimestatus : "(Hours : minutes)"
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
/// textlang : "language"
/// textlangdetail : "Thai"
/// textstdtc : "Student / Teacher"
/// btncpass : "Change password"
/// btndelacc : "Delete account"
/// textappver : "Application version"
/// btnlogout : "Logout"

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

  Screeninfo.fromJson(dynamic json) {
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
Screeninfo copyWith({  String? titlestatus,
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
}) => Screeninfo(  titlestatus: titlestatus ?? _titlestatus,
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