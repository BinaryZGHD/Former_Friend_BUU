import 'dart:convert';

/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"Titleaddact":"Add activity","Titleeditact":"Edit activity","Edtactname":"Activity name / Project name","Edtyear":"Year","Edtterm":"Term","Edtstartdate":"Start date","Edtfinishdate":"Finish date","Edttime":"Total time(Hours)","Edttvenue":"Venue","Edtdetail":"Detail","Btnconfirm":"Confirm"},"yearlist":["2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033"],"termlist":["1","2","summer"],"approverlist":["1李四张三李四三","2李李四李三四李四四","3张三李四李四张三","4李四张三李四三","5李李四李三四李四四","6张三李四李四张三"]}

AddActivityScreenApi addActivityScreenApiFromJson(String str) =>
    AddActivityScreenApi.fromJson(json.decode(str));
String addActivityScreenApiToJson(AddActivityScreenApi data) =>
    json.encode(data.toJson());

class AddActivityScreenApi {
  AddActivityScreenApi({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  AddActivityScreenApi.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  AddActivityScreenApi copyWith({
    Head? head,
    Body? body,
  }) =>
      AddActivityScreenApi(
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

/// screeninfo : {"titleaddact":"Add activity","titleeditact":"Edit activity","edtactname":"Activity name / Project name","edtyear":"Year","edtterm":"Term","edtstartdate":"Start date","edtfinishdate":"Finish date","edttime":"Total time(Hours)","edtvenue":"Venue","edtapprover":"Approver","edtdetail":"Detail","btnconfirm":"Confirm"}
/// yearlist : ["2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033"]
/// termlist : ["1","2","summer"]
/// approverlist : ["1. กฤตัชญ์ - ผู้รู้คุณคนอื่น มีความกตัญญู","2. คณุตม์ - ประเสริฐกว่าคนทั้งหลาย","3. จิรทีปต์ - รุ่งเรืองตลอดกาลนาน","4. ณัฐปคัลภ์ - ปราชญ์ผู้องอาจ","5. ติณณภพ - ผู้ข้ามภพได้ ชื่อของผู้บรรลุธรรม","6. นิพพิชฌน์ - ปัญญา เข้าใจทะลุปรุโปร่ง ตรัสรู้","7. ผรัณชัย - มีชัยชนะไปทั่ว","8. พิทยุตม์ - ผู้มีความรู้สูงสุด","9. ศาตนันท์ - มีความสุขและความเพลิดเพลิน","10. อนันยช - เกิดมาเป็นที่หนึ่ง","11. อิงครัต - ผู้ยินดีในความรู้","12. กฤตยชญ์ - นักปราชญ์ผู้คงแก่เรียน","13. คณพศ - มีอำนาจในหมู่คณะ","14. ชวกร - ผู้สร้างเชาวน์ ผู้มีเชาวน์","15. ณฏฐพล - กำลังของนักปราชญ์","17. ธรรมปพน - มีคุณธรรมบริสุทธิ์","18. นฤสรณ์ - เป็นที่พึ่งของคนทั้งหลาย","19. วรลภย์ - ผู้มีลาภอันประเสริฐ","20. วฤนท์ธม - มากมายยิ่งใหญ่","21. สรฐชญณ์ - มีความรู้เป็นที่พึ่งอย่างมั่นคง","22. จรณินทร์ - เป็นใหญ่เพราะความประพฤติดี","23. จิรัฎฐ์ - ดำรงมั่น อยู่นาน","24. ชิณณวรรธน์ - อยู่กับความเจริญ","25. ญานุจจัย - สะสมความรู้ มีความรู้มาก","26. ถิรพุทธิ์ - มีความรู้มั่นคง","27. ทัณฑธร - ผู้พิพากษา","28. ปุณณัตถ์ - สมประสงค์","29. พฤนท์เดช - มีอำนาจทางทหาร","30. ภัทรจาริน - มีความประพฤติดี","31. ฤทธิรณ - ความเก่งกล้าในการรบ","32. วัณณุวรรธน์ - ทางแห่งความเจริญ","33. อจลวิชญ์ - มีความรู้ไม่หวั่นไหว","34. อติวัณณ์ - การสรรเสริญ ผู้มีตระกูลสูง","35. อติวิชญ์ - นักปราชญ์ผู้ยิ่งใหญ่ ผู้มีตระกูลสูง","36. อัฑฒ์ - ชายผู้ร่ำรวย","37. คณุฒน์ - ประเสริฐกว่าคนทั้งหลาย","38. ฐปนวัฒน์ - เจริญอย่างมั่นคง","39. ฐิตธีร์ - ปราชญ์ผุ้มั่นคง","40. ฐิติวัสส์ - ยืนยาวตลอดปี","41. ธุวานันท์ - มีความยินดียั้งยืน มีความสุขยั่งยืน","42. นนทิวรรธน์ - ยินดีในทรัพย์","43. นัธทวัฒน์ - มีความเจริญเป็นที่มั่นคง","44. ปัณฑ์ธร - ทรงไว้ซึ่งความรู้","45. พิชญุตม์ - ฉลาดและยิ่งใหญ่","46. พลัฎฐ์ - ตั้งอยู่ในกำลัง ทรงพลัง","47. วริทธิ์นันท์ - ยินดีในความสำเร็จอันประเสริฐ","48. วเรณย์ - ประเสริฐสุด","49. อุกฤษฎ์ - ประเสริฐสุด","50. กฤติชยตร์ - การกระทำที่ฉลาด"]

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

/// titleaddact : "Add activity"
/// titleeditact : "Edit activity"
/// edtactname : "Activity name / Project name"
/// edtyear : "Year"
/// edtterm : "Term"
/// edtstartdate : "Start date"
/// edtfinishdate : "Finish date"
/// edttime : "Total time(Hours)"
/// edtvenue : "Venue"
/// edtapprover : "Approver"
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
    String? edtvenue,
    String? edtapprover,
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
    _edtvenue = edtvenue;
    _edtapprover = edtapprover;
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
    _edtvenue = json['edtvenue'];
    _edtapprover = json['edtapprover'];
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
  String? _edtvenue;
  String? _edtapprover;
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
    String? edtvenue,
    String? edtapprover,
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
    edtvenue: edtvenue ?? _edtvenue,
    edtapprover: edtapprover ?? _edtapprover,
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
  String? get edtvenue => _edtvenue;
  String? get edtapprover => _edtapprover;
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
    map['edtvenue'] = _edtvenue;
    map['edtapprover'] = _edtapprover;
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