import 'dart:convert';
/// head : {"status":200,"message":"susccess","module":"profile"}
/// body : {"screeninfo":{"titleprofile":"Profile","subtitlegeninfor":"General information","subtitlecont":"Contact","subtitleeduinfo":"Education information","subtitleaddress":"Address","subtitleworkinfo":"Career","textedit":"Edit","textsave":"Save","textname":"Name","textlname":"Lastname","textnickname":"Nickname","textstdcode":"Student code","textgen":"Generation","texttel":"Tel","textfac":"Faculty","textdepart":"Department","textmajor":"Major","textgpaju":"GPA (Junior high school)","textgpase":"GPA (Senior high school)","textgpaba":"GPA (Bachelor degree)","texthousenumber":"House no.","textmoo":"Moo","textsoi":"Soi","textroad":"Road","textsubdistrict":"Subdistrict","textdistrict":"District","textprovince":"Province","textzipcode":"Zip code","subtitleworkplace":"Work place","textcomp":"Company","textatt":"Attention","textcareer":"Career","textJobtype":"Job type ","textemp":"Employed","textunemp":"Unemployed","textfustud":"Futher study","textstudying":"Studying","textstatus":"Status"},"profile_general_info":{"name":"คณิศาสตร์","surname":"สถิติวิชาการ","nickname":"AKA คำฝอย","stu_code":"6203XXXXX","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"},"profile_edu_info":{"faculty":"Science","department":"Mathematics","major":" Math","gpa_bd":"4.00 ","gpa_jhs":"4.00","gpa_shs":"4.00"},"profile_address_info":{"number":"156/4","moo":"-","soi":"-","road":"-","subdistrict":"-","district":"-","province":"-","zipcode":"12345"},"profile_contact_info":{"phone":"085-123-4567","line":"@scimath","facebook":"scimathface","instagram":"scimathig","twitter":"scimathtwitter","youtube":"scimathutube"},"profile_career_screeninfo":{"attention":[{"attenname":"อื่นๆ"},{"attenname":"คอมพิวเตอร์ "},{"attenname":"ครู"},{"attenname":"ประกันภัย"},{"attenname":"สถิติ"},{"attenname":"ค้าขาย"},{"attenname":"อื่นๆ ครับ"}],"status":[{"statusname":"อื่นๆ"},{"statusname":"ศึกษาต่อ"},{"statusname":"ว่างงาน"},{"statusname":"มีงานทำ"},{"statusname":"กำลังจะมีงานทำ"},{"statusname":"อื่นๆ ครับครับ"}],"jobtype":[{"jobname":"0"},{"jobname":"1"},{"jobname":"2"},{"jobname":"อื่นๆ"},{"jobname":"อื่นๆ ครับครับครับ"}]},"profile_career_info":{"company":"Burapha company","attention":"อื่นๆ","status":"ว่างงาน","jobtype":"อื่นๆ","userworkplace":"BURAPHA Univer ครับ","usercareer":"Developer ครับ","usercompany":"Burapha company ครับ","userattention":"อื่นๆ ครับ","userstatus":"อื่นๆ ครับครับ","userjobtype":"อื่นๆ ครับครับครับ"}}

ApiProfileResponse apiProfileFromJson(String str) => ApiProfileResponse.fromJson(json.decode(str));
String apiProfileToJson(ApiProfileResponse data) => json.encode(data.toJson());
class ApiProfileResponse {
  ApiProfileResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ApiProfileResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ApiProfileResponse copyWith({  Head? head,
  Body? body,
}) => ApiProfileResponse(  head: head ?? _head,
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

/// screeninfo : {"titleprofile":"Profile","subtitlegeninfor":"General information","subtitlecont":"Contact","subtitleeduinfo":"Education information","subtitleaddress":"Address","subtitleworkinfo":"Career","textedit":"Edit","textsave":"Save","textname":"Name","textlname":"Lastname","textnickname":"Nickname","textstdcode":"Student code","textgen":"Generation","texttel":"Tel","textfac":"Faculty","textdepart":"Department","textmajor":"Major","textgpaju":"GPA (Junior high school)","textgpase":"GPA (Senior high school)","textgpaba":"GPA (Bachelor degree)","texthousenumber":"House no.","textmoo":"Moo","textsoi":"Soi","textroad":"Road","textsubdistrict":"Subdistrict","textdistrict":"District","textprovince":"Province","textzipcode":"Zip code","subtitleworkplace":"Work place","textcomp":"Company","textatt":"Attention","textcareer":"Career","textJobtype":"Job type ","textemp":"Employed","textunemp":"Unemployed","textfustud":"Futher study","textstudying":"Studying","textstatus":"Status"}
/// profile_general_info : {"name":"คณิศาสตร์","surname":"สถิติวิชาการ","nickname":"AKA คำฝอย","stu_code":"6203XXXXX","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"}
/// profile_edu_info : {"faculty":"Science","department":"Mathematics","major":" Math","gpa_bd":"4.00 ","gpa_jhs":"4.00","gpa_shs":"4.00"}
/// profile_address_info : {"number":"156/4","moo":"-","soi":"-","road":"-","subdistrict":"-","district":"-","province":"-","zipcode":"12345"}
/// profile_contact_info : {"phone":"085-123-4567","line":"@scimath","facebook":"scimathface","instagram":"scimathig","twitter":"scimathtwitter","youtube":"scimathutube"}
/// profile_career_screeninfo : {"attention":[{"attenname":"อื่นๆ"},{"attenname":"คอมพิวเตอร์ "},{"attenname":"ครู"},{"attenname":"ประกันภัย"},{"attenname":"สถิติ"},{"attenname":"ค้าขาย"},{"attenname":"อื่นๆ ครับ"}],"status":[{"statusname":"อื่นๆ"},{"statusname":"ศึกษาต่อ"},{"statusname":"ว่างงาน"},{"statusname":"มีงานทำ"},{"statusname":"กำลังจะมีงานทำ"},{"statusname":"อื่นๆ ครับครับ"}],"jobtype":[{"jobname":"0"},{"jobname":"1"},{"jobname":"2"},{"jobname":"อื่นๆ"},{"jobname":"อื่นๆ ครับครับครับ"}]}
/// profile_career_info : {"company":"Burapha company","attention":"อื่นๆ","status":"ว่างงาน","jobtype":"อื่นๆ","userworkplace":"BURAPHA Univer ครับ","usercareer":"Developer ครับ","usercompany":"Burapha company ครับ","userattention":"อื่นๆ ครับ","userstatus":"อื่นๆ ครับครับ","userjobtype":"อื่นๆ ครับครับครับ"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      ProfileGeneralInfo? profileGeneralInfo, 
      ProfileEduInfo? profileEduInfo, 
      ProfileAddressInfo? profileAddressInfo, 
      ProfileContactInfo? profileContactInfo, 
      ProfileCareerScreeninfo? profileCareerScreeninfo, 
      ProfileCareerInfo? profileCareerInfo,}){
    _screeninfo = screeninfo;
    _profileGeneralInfo = profileGeneralInfo;
    _profileEduInfo = profileEduInfo;
    _profileAddressInfo = profileAddressInfo;
    _profileContactInfo = profileContactInfo;
    _profileCareerScreeninfo = profileCareerScreeninfo;
    _profileCareerInfo = profileCareerInfo;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _profileGeneralInfo = json['profile_general_info'] != null ? ProfileGeneralInfo.fromJson(json['profile_general_info']) : null;
    _profileEduInfo = json['profile_edu_info'] != null ? ProfileEduInfo.fromJson(json['profile_edu_info']) : null;
    _profileAddressInfo = json['profile_address_info'] != null ? ProfileAddressInfo.fromJson(json['profile_address_info']) : null;
    _profileContactInfo = json['profile_contact_info'] != null ? ProfileContactInfo.fromJson(json['profile_contact_info']) : null;
    _profileCareerScreeninfo = json['profile_career_screeninfo'] != null ? ProfileCareerScreeninfo.fromJson(json['profile_career_screeninfo']) : null;
    _profileCareerInfo = json['profile_career_info'] != null ? ProfileCareerInfo.fromJson(json['profile_career_info']) : null;
  }
  Screeninfo? _screeninfo;
  ProfileGeneralInfo? _profileGeneralInfo;
  ProfileEduInfo? _profileEduInfo;
  ProfileAddressInfo? _profileAddressInfo;
  ProfileContactInfo? _profileContactInfo;
  ProfileCareerScreeninfo? _profileCareerScreeninfo;
  ProfileCareerInfo? _profileCareerInfo;
Body copyWith({  Screeninfo? screeninfo,
  ProfileGeneralInfo? profileGeneralInfo,
  ProfileEduInfo? profileEduInfo,
  ProfileAddressInfo? profileAddressInfo,
  ProfileContactInfo? profileContactInfo,
  ProfileCareerScreeninfo? profileCareerScreeninfo,
  ProfileCareerInfo? profileCareerInfo,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  profileGeneralInfo: profileGeneralInfo ?? _profileGeneralInfo,
  profileEduInfo: profileEduInfo ?? _profileEduInfo,
  profileAddressInfo: profileAddressInfo ?? _profileAddressInfo,
  profileContactInfo: profileContactInfo ?? _profileContactInfo,
  profileCareerScreeninfo: profileCareerScreeninfo ?? _profileCareerScreeninfo,
  profileCareerInfo: profileCareerInfo ?? _profileCareerInfo,
);
  Screeninfo? get screeninfo => _screeninfo;
  ProfileGeneralInfo? get profileGeneralInfo => _profileGeneralInfo;
  ProfileEduInfo? get profileEduInfo => _profileEduInfo;
  ProfileAddressInfo? get profileAddressInfo => _profileAddressInfo;
  ProfileContactInfo? get profileContactInfo => _profileContactInfo;
  ProfileCareerScreeninfo? get profileCareerScreeninfo => _profileCareerScreeninfo;
  ProfileCareerInfo? get profileCareerInfo => _profileCareerInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_profileGeneralInfo != null) {
      map['profile_general_info'] = _profileGeneralInfo?.toJson();
    }
    if (_profileEduInfo != null) {
      map['profile_edu_info'] = _profileEduInfo?.toJson();
    }
    if (_profileAddressInfo != null) {
      map['profile_address_info'] = _profileAddressInfo?.toJson();
    }
    if (_profileContactInfo != null) {
      map['profile_contact_info'] = _profileContactInfo?.toJson();
    }
    if (_profileCareerScreeninfo != null) {
      map['profile_career_screeninfo'] = _profileCareerScreeninfo?.toJson();
    }
    if (_profileCareerInfo != null) {
      map['profile_career_info'] = _profileCareerInfo?.toJson();
    }
    return map;
  }

}

/// company : "Burapha company"
/// attention : "อื่นๆ"
/// status : "ว่างงาน"
/// jobtype : "อื่นๆ"
/// userworkplace : "BURAPHA Univer ครับ"
/// usercareer : "Developer ครับ"
/// usercompany : "Burapha company ครับ"
/// userattention : "อื่นๆ ครับ"
/// userstatus : "อื่นๆ ครับครับ"
/// userjobtype : "อื่นๆ ครับครับครับ"

ProfileCareerInfo profileCareerInfoFromJson(String str) => ProfileCareerInfo.fromJson(json.decode(str));
String profileCareerInfoToJson(ProfileCareerInfo data) => json.encode(data.toJson());
class ProfileCareerInfo {
  ProfileCareerInfo({
      String? company, 
      String? attention, 
      String? status, 
      String? jobtype, 
      String? userworkplace, 
      String? usercareer, 
      String? usercompany, 
      String? userattention, 
      String? userstatus, 
      String? userjobtype,}){
    _company = company;
    _attention = attention;
    _status = status;
    _jobtype = jobtype;
    _userworkplace = userworkplace;
    _usercareer = usercareer;
    _usercompany = usercompany;
    _userattention = userattention;
    _userstatus = userstatus;
    _userjobtype = userjobtype;
}

  ProfileCareerInfo.fromJson(dynamic json) {
    _company = json['company'];
    _attention = json['attention'];
    _status = json['status'];
    _jobtype = json['jobtype'];
    _userworkplace = json['userworkplace'];
    _usercareer = json['usercareer'];
    _usercompany = json['usercompany'];
    _userattention = json['userattention'];
    _userstatus = json['userstatus'];
    _userjobtype = json['userjobtype'];
  }
  String? _company;
  String? _attention;
  String? _status;
  String? _jobtype;
  String? _userworkplace;
  String? _usercareer;
  String? _usercompany;
  String? _userattention;
  String? _userstatus;
  String? _userjobtype;
ProfileCareerInfo copyWith({  String? company,
  String? attention,
  String? status,
  String? jobtype,
  String? userworkplace,
  String? usercareer,
  String? usercompany,
  String? userattention,
  String? userstatus,
  String? userjobtype,
}) => ProfileCareerInfo(  company: company ?? _company,
  attention: attention ?? _attention,
  status: status ?? _status,
  jobtype: jobtype ?? _jobtype,
  userworkplace: userworkplace ?? _userworkplace,
  usercareer: usercareer ?? _usercareer,
  usercompany: usercompany ?? _usercompany,
  userattention: userattention ?? _userattention,
  userstatus: userstatus ?? _userstatus,
  userjobtype: userjobtype ?? _userjobtype,
);
  String? get company => _company;
  String? get attention => _attention;
  String? get status => _status;
  String? get jobtype => _jobtype;
  String? get userworkplace => _userworkplace;
  String? get usercareer => _usercareer;
  String? get usercompany => _usercompany;
  String? get userattention => _userattention;
  String? get userstatus => _userstatus;
  String? get userjobtype => _userjobtype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company'] = _company;
    map['attention'] = _attention;
    map['status'] = _status;
    map['jobtype'] = _jobtype;
    map['userworkplace'] = _userworkplace;
    map['usercareer'] = _usercareer;
    map['usercompany'] = _usercompany;
    map['userattention'] = _userattention;
    map['userstatus'] = _userstatus;
    map['userjobtype'] = _userjobtype;
    return map;
  }

}

/// attention : [{"attenname":"อื่นๆ"},{"attenname":"คอมพิวเตอร์ "},{"attenname":"ครู"},{"attenname":"ประกันภัย"},{"attenname":"สถิติ"},{"attenname":"ค้าขาย"},{"attenname":"อื่นๆ ครับ"}]
/// status : [{"statusname":"อื่นๆ"},{"statusname":"ศึกษาต่อ"},{"statusname":"ว่างงาน"},{"statusname":"มีงานทำ"},{"statusname":"กำลังจะมีงานทำ"},{"statusname":"อื่นๆ ครับครับ"}]
/// jobtype : [{"jobname":"0"},{"jobname":"1"},{"jobname":"2"},{"jobname":"อื่นๆ"},{"jobname":"อื่นๆ ครับครับครับ"}]

ProfileCareerScreeninfo profileCareerScreeninfoFromJson(String str) => ProfileCareerScreeninfo.fromJson(json.decode(str));
String profileCareerScreeninfoToJson(ProfileCareerScreeninfo data) => json.encode(data.toJson());
class ProfileCareerScreeninfo {
  ProfileCareerScreeninfo({
      List<Attention>? attention, 
      List<Status>? status, 
      List<Jobtype>? jobtype,}){
    _attention = attention;
    _status = status;
    _jobtype = jobtype;
}

  ProfileCareerScreeninfo.fromJson(dynamic json) {
    if (json['attention'] != null) {
      _attention = [];
      json['attention'].forEach((v) {
        _attention?.add(Attention.fromJson(v));
      });
    }
    if (json['status'] != null) {
      _status = [];
      json['status'].forEach((v) {
        _status?.add(Status.fromJson(v));
      });
    }
    if (json['jobtype'] != null) {
      _jobtype = [];
      json['jobtype'].forEach((v) {
        _jobtype?.add(Jobtype.fromJson(v));
      });
    }
  }
  List<Attention>? _attention;
  List<Status>? _status;
  List<Jobtype>? _jobtype;
ProfileCareerScreeninfo copyWith({  List<Attention>? attention,
  List<Status>? status,
  List<Jobtype>? jobtype,
}) => ProfileCareerScreeninfo(  attention: attention ?? _attention,
  status: status ?? _status,
  jobtype: jobtype ?? _jobtype,
);
  List<Attention>? get attention => _attention;
  List<Status>? get status => _status;
  List<Jobtype>? get jobtype => _jobtype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_attention != null) {
      map['attention'] = _attention?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.map((v) => v.toJson()).toList();
    }
    if (_jobtype != null) {
      map['jobtype'] = _jobtype?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// jobname : "0"

Jobtype jobtypeFromJson(String str) => Jobtype.fromJson(json.decode(str));
String jobtypeToJson(Jobtype data) => json.encode(data.toJson());
class Jobtype {
  Jobtype({
      String? jobname,}){
    _jobname = jobname;
}

  Jobtype.fromJson(dynamic json) {
    _jobname = json['jobname'];
  }
  String? _jobname;
Jobtype copyWith({  String? jobname,
}) => Jobtype(  jobname: jobname ?? _jobname,
);
  String? get jobname => _jobname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jobname'] = _jobname;
    return map;
  }

}

/// statusname : "อื่นๆ"

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      String? statusname,}){
    _statusname = statusname;
}

  Status.fromJson(dynamic json) {
    _statusname = json['statusname'];
  }
  String? _statusname;
Status copyWith({  String? statusname,
}) => Status(  statusname: statusname ?? _statusname,
);
  String? get statusname => _statusname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusname'] = _statusname;
    return map;
  }

}

/// attenname : "อื่นๆ"

Attention attentionFromJson(String str) => Attention.fromJson(json.decode(str));
String attentionToJson(Attention data) => json.encode(data.toJson());
class Attention {
  Attention({
      String? attenname,}){
    _attenname = attenname;
}

  Attention.fromJson(dynamic json) {
    _attenname = json['attenname'];
  }
  String? _attenname;
Attention copyWith({  String? attenname,
}) => Attention(  attenname: attenname ?? _attenname,
);
  String? get attenname => _attenname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attenname'] = _attenname;
    return map;
  }

}

/// phone : "085-123-4567"
/// line : "@scimath"
/// facebook : "scimathface"
/// instagram : "scimathig"
/// twitter : "scimathtwitter"
/// youtube : "scimathutube"

ProfileContactInfo profileContactInfoFromJson(String str) => ProfileContactInfo.fromJson(json.decode(str));
String profileContactInfoToJson(ProfileContactInfo data) => json.encode(data.toJson());
class ProfileContactInfo {
  ProfileContactInfo({
      String? phone, 
      String? line, 
      String? facebook, 
      String? instagram, 
      String? twitter, 
      String? youtube,}){
    _phone = phone;
    _line = line;
    _facebook = facebook;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
}

  ProfileContactInfo.fromJson(dynamic json) {
    _phone = json['phone'];
    _line = json['line'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
  }
  String? _phone;
  String? _line;
  String? _facebook;
  String? _instagram;
  String? _twitter;
  String? _youtube;
ProfileContactInfo copyWith({  String? phone,
  String? line,
  String? facebook,
  String? instagram,
  String? twitter,
  String? youtube,
}) => ProfileContactInfo(  phone: phone ?? _phone,
  line: line ?? _line,
  facebook: facebook ?? _facebook,
  instagram: instagram ?? _instagram,
  twitter: twitter ?? _twitter,
  youtube: youtube ?? _youtube,
);
  String? get phone => _phone;
  String? get line => _line;
  String? get facebook => _facebook;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['line'] = _line;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
    return map;
  }

}

/// number : "156/4"
/// moo : "-"
/// soi : "-"
/// road : "-"
/// subdistrict : "-"
/// district : "-"
/// province : "-"
/// zipcode : "12345"

ProfileAddressInfo profileAddressInfoFromJson(String str) => ProfileAddressInfo.fromJson(json.decode(str));
String profileAddressInfoToJson(ProfileAddressInfo data) => json.encode(data.toJson());
class ProfileAddressInfo {
  ProfileAddressInfo({
      String? number, 
      String? moo, 
      String? soi, 
      String? road, 
      String? subdistrict, 
      String? district, 
      String? province, 
      String? zipcode,}){
    _number = number;
    _moo = moo;
    _soi = soi;
    _road = road;
    _subdistrict = subdistrict;
    _district = district;
    _province = province;
    _zipcode = zipcode;
}

  ProfileAddressInfo.fromJson(dynamic json) {
    _number = json['number'];
    _moo = json['moo'];
    _soi = json['soi'];
    _road = json['road'];
    _subdistrict = json['subdistrict'];
    _district = json['district'];
    _province = json['province'];
    _zipcode = json['zipcode'];
  }
  String? _number;
  String? _moo;
  String? _soi;
  String? _road;
  String? _subdistrict;
  String? _district;
  String? _province;
  String? _zipcode;
ProfileAddressInfo copyWith({  String? number,
  String? moo,
  String? soi,
  String? road,
  String? subdistrict,
  String? district,
  String? province,
  String? zipcode,
}) => ProfileAddressInfo(  number: number ?? _number,
  moo: moo ?? _moo,
  soi: soi ?? _soi,
  road: road ?? _road,
  subdistrict: subdistrict ?? _subdistrict,
  district: district ?? _district,
  province: province ?? _province,
  zipcode: zipcode ?? _zipcode,
);
  String? get number => _number;
  String? get moo => _moo;
  String? get soi => _soi;
  String? get road => _road;
  String? get subdistrict => _subdistrict;
  String? get district => _district;
  String? get province => _province;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['moo'] = _moo;
    map['soi'] = _soi;
    map['road'] = _road;
    map['subdistrict'] = _subdistrict;
    map['district'] = _district;
    map['province'] = _province;
    map['zipcode'] = _zipcode;
    return map;
  }

}

/// faculty : "Science"
/// department : "Mathematics"
/// major : " Math"
/// gpa_bd : "4.00 "
/// gpa_jhs : "4.00"
/// gpa_shs : "4.00"

ProfileEduInfo profileEduInfoFromJson(String str) => ProfileEduInfo.fromJson(json.decode(str));
String profileEduInfoToJson(ProfileEduInfo data) => json.encode(data.toJson());
class ProfileEduInfo {
  ProfileEduInfo({
      String? faculty, 
      String? department, 
      String? major, 
      String? gpaBd, 
      String? gpaJhs, 
      String? gpaShs,}){
    _faculty = faculty;
    _department = department;
    _major = major;
    _gpaBd = gpaBd;
    _gpaJhs = gpaJhs;
    _gpaShs = gpaShs;
}

  ProfileEduInfo.fromJson(dynamic json) {
    _faculty = json['faculty'];
    _department = json['department'];
    _major = json['major'];
    _gpaBd = json['gpa_bd'];
    _gpaJhs = json['gpa_jhs'];
    _gpaShs = json['gpa_shs'];
  }
  String? _faculty;
  String? _department;
  String? _major;
  String? _gpaBd;
  String? _gpaJhs;
  String? _gpaShs;
ProfileEduInfo copyWith({  String? faculty,
  String? department,
  String? major,
  String? gpaBd,
  String? gpaJhs,
  String? gpaShs,
}) => ProfileEduInfo(  faculty: faculty ?? _faculty,
  department: department ?? _department,
  major: major ?? _major,
  gpaBd: gpaBd ?? _gpaBd,
  gpaJhs: gpaJhs ?? _gpaJhs,
  gpaShs: gpaShs ?? _gpaShs,
);
  String? get faculty => _faculty;
  String? get department => _department;
  String? get major => _major;
  String? get gpaBd => _gpaBd;
  String? get gpaJhs => _gpaJhs;
  String? get gpaShs => _gpaShs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['faculty'] = _faculty;
    map['department'] = _department;
    map['major'] = _major;
    map['gpa_bd'] = _gpaBd;
    map['gpa_jhs'] = _gpaJhs;
    map['gpa_shs'] = _gpaShs;
    return map;
  }

}

/// name : "คณิศาสตร์"
/// surname : "สถิติวิชาการ"
/// nickname : "AKA คำฝอย"
/// stu_code : "6203XXXXX"
/// gen : "X6"
/// genname : "กรีนทีมัทฉะลาเต้"
/// gencolor : "#9ED9C5"
/// studentid : "6203XXXXX"
/// email : "StudentCodeID@morebuu.ac.th"
/// role : "Student"
/// img : "https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"

ProfileGeneralInfo profileGeneralInfoFromJson(String str) => ProfileGeneralInfo.fromJson(json.decode(str));
String profileGeneralInfoToJson(ProfileGeneralInfo data) => json.encode(data.toJson());
class ProfileGeneralInfo {
  ProfileGeneralInfo({
      String? name, 
      String? surname, 
      String? nickname, 
      String? stuCode, 
      String? gen, 
      String? genname, 
      String? gencolor, 
      String? studentid, 
      String? email, 
      String? role, 
      String? img,}){
    _name = name;
    _surname = surname;
    _nickname = nickname;
    _stuCode = stuCode;
    _gen = gen;
    _genname = genname;
    _gencolor = gencolor;
    _studentid = studentid;
    _email = email;
    _role = role;
    _img = img;
}

  ProfileGeneralInfo.fromJson(dynamic json) {
    _name = json['name'];
    _surname = json['surname'];
    _nickname = json['nickname'];
    _stuCode = json['stu_code'];
    _gen = json['gen'];
    _genname = json['genname'];
    _gencolor = json['gencolor'];
    _studentid = json['studentid'];
    _email = json['email'];
    _role = json['role'];
    _img = json['img'];
  }
  String? _name;
  String? _surname;
  String? _nickname;
  String? _stuCode;
  String? _gen;
  String? _genname;
  String? _gencolor;
  String? _studentid;
  String? _email;
  String? _role;
  String? _img;
ProfileGeneralInfo copyWith({  String? name,
  String? surname,
  String? nickname,
  String? stuCode,
  String? gen,
  String? genname,
  String? gencolor,
  String? studentid,
  String? email,
  String? role,
  String? img,
}) => ProfileGeneralInfo(  name: name ?? _name,
  surname: surname ?? _surname,
  nickname: nickname ?? _nickname,
  stuCode: stuCode ?? _stuCode,
  gen: gen ?? _gen,
  genname: genname ?? _genname,
  gencolor: gencolor ?? _gencolor,
  studentid: studentid ?? _studentid,
  email: email ?? _email,
  role: role ?? _role,
  img: img ?? _img,
);
  String? get name => _name;
  String? get surname => _surname;
  String? get nickname => _nickname;
  String? get stuCode => _stuCode;
  String? get gen => _gen;
  String? get genname => _genname;
  String? get gencolor => _gencolor;
  String? get studentid => _studentid;
  String? get email => _email;
  String? get role => _role;
  String? get img => _img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['surname'] = _surname;
    map['nickname'] = _nickname;
    map['stu_code'] = _stuCode;
    map['gen'] = _gen;
    map['genname'] = _genname;
    map['gencolor'] = _gencolor;
    map['studentid'] = _studentid;
    map['email'] = _email;
    map['role'] = _role;
    map['img'] = _img;
    return map;
  }

}

/// titleprofile : "Profile"
/// subtitlegeninfor : "General information"
/// subtitlecont : "Contact"
/// subtitleeduinfo : "Education information"
/// subtitleaddress : "Address"
/// subtitleworkinfo : "Career"
/// textedit : "Edit"
/// textsave : "Save"
/// textname : "Name"
/// textlname : "Lastname"
/// textnickname : "Nickname"
/// textstdcode : "Student code"
/// textgen : "Generation"
/// texttel : "Tel"
/// textfac : "Faculty"
/// textdepart : "Department"
/// textmajor : "Major"
/// textgpaju : "GPA (Junior high school)"
/// textgpase : "GPA (Senior high school)"
/// textgpaba : "GPA (Bachelor degree)"
/// texthousenumber : "House no."
/// textmoo : "Moo"
/// textsoi : "Soi"
/// textroad : "Road"
/// textsubdistrict : "Subdistrict"
/// textdistrict : "District"
/// textprovince : "Province"
/// textzipcode : "Zip code"
/// subtitleworkplace : "Work place"
/// textcomp : "Company"
/// textatt : "Attention"
/// textcareer : "Career"
/// textJobtype : "Job type "
/// textemp : "Employed"
/// textunemp : "Unemployed"
/// textfustud : "Futher study"
/// textstudying : "Studying"
/// textstatus : "Status"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleprofile, 
      String? subtitlegeninfor, 
      String? subtitlecont, 
      String? subtitleeduinfo, 
      String? subtitleaddress, 
      String? subtitleworkinfo, 
      String? textedit, 
      String? textsave, 
      String? textname, 
      String? textlname, 
      String? textnickname, 
      String? textstdcode, 
      String? textgen, 
      String? texttel, 
      String? textfac, 
      String? textdepart, 
      String? textmajor, 
      String? textgpaju, 
      String? textgpase, 
      String? textgpaba, 
      String? texthousenumber, 
      String? textmoo, 
      String? textsoi, 
      String? textroad, 
      String? textsubdistrict, 
      String? textdistrict, 
      String? textprovince, 
      String? textzipcode, 
      String? subtitleworkplace, 
      String? textcomp, 
      String? textatt, 
      String? textcareer, 
      String? textJobtype, 
      String? textemp, 
      String? textunemp, 
      String? textfustud, 
      String? textstudying, 
      String? textstatus,}){
    _titleprofile = titleprofile;
    _subtitlegeninfor = subtitlegeninfor;
    _subtitlecont = subtitlecont;
    _subtitleeduinfo = subtitleeduinfo;
    _subtitleaddress = subtitleaddress;
    _subtitleworkinfo = subtitleworkinfo;
    _textedit = textedit;
    _textsave = textsave;
    _textname = textname;
    _textlname = textlname;
    _textnickname = textnickname;
    _textstdcode = textstdcode;
    _textgen = textgen;
    _texttel = texttel;
    _textfac = textfac;
    _textdepart = textdepart;
    _textmajor = textmajor;
    _textgpaju = textgpaju;
    _textgpase = textgpase;
    _textgpaba = textgpaba;
    _texthousenumber = texthousenumber;
    _textmoo = textmoo;
    _textsoi = textsoi;
    _textroad = textroad;
    _textsubdistrict = textsubdistrict;
    _textdistrict = textdistrict;
    _textprovince = textprovince;
    _textzipcode = textzipcode;
    _subtitleworkplace = subtitleworkplace;
    _textcomp = textcomp;
    _textatt = textatt;
    _textcareer = textcareer;
    _textJobtype = textJobtype;
    _textemp = textemp;
    _textunemp = textunemp;
    _textfustud = textfustud;
    _textstudying = textstudying;
    _textstatus = textstatus;
}

  Screeninfo.fromJson(dynamic json) {
    _titleprofile = json['titleprofile'];
    _subtitlegeninfor = json['subtitlegeninfor'];
    _subtitlecont = json['subtitlecont'];
    _subtitleeduinfo = json['subtitleeduinfo'];
    _subtitleaddress = json['subtitleaddress'];
    _subtitleworkinfo = json['subtitleworkinfo'];
    _textedit = json['textedit'];
    _textsave = json['textsave'];
    _textname = json['textname'];
    _textlname = json['textlname'];
    _textnickname = json['textnickname'];
    _textstdcode = json['textstdcode'];
    _textgen = json['textgen'];
    _texttel = json['texttel'];
    _textfac = json['textfac'];
    _textdepart = json['textdepart'];
    _textmajor = json['textmajor'];
    _textgpaju = json['textgpaju'];
    _textgpase = json['textgpase'];
    _textgpaba = json['textgpaba'];
    _texthousenumber = json['texthousenumber'];
    _textmoo = json['textmoo'];
    _textsoi = json['textsoi'];
    _textroad = json['textroad'];
    _textsubdistrict = json['textsubdistrict'];
    _textdistrict = json['textdistrict'];
    _textprovince = json['textprovince'];
    _textzipcode = json['textzipcode'];
    _subtitleworkplace = json['subtitleworkplace'];
    _textcomp = json['textcomp'];
    _textatt = json['textatt'];
    _textcareer = json['textcareer'];
    _textJobtype = json['textJobtype'];
    _textemp = json['textemp'];
    _textunemp = json['textunemp'];
    _textfustud = json['textfustud'];
    _textstudying = json['textstudying'];
    _textstatus = json['textstatus'];
  }
  String? _titleprofile;
  String? _subtitlegeninfor;
  String? _subtitlecont;
  String? _subtitleeduinfo;
  String? _subtitleaddress;
  String? _subtitleworkinfo;
  String? _textedit;
  String? _textsave;
  String? _textname;
  String? _textlname;
  String? _textnickname;
  String? _textstdcode;
  String? _textgen;
  String? _texttel;
  String? _textfac;
  String? _textdepart;
  String? _textmajor;
  String? _textgpaju;
  String? _textgpase;
  String? _textgpaba;
  String? _texthousenumber;
  String? _textmoo;
  String? _textsoi;
  String? _textroad;
  String? _textsubdistrict;
  String? _textdistrict;
  String? _textprovince;
  String? _textzipcode;
  String? _subtitleworkplace;
  String? _textcomp;
  String? _textatt;
  String? _textcareer;
  String? _textJobtype;
  String? _textemp;
  String? _textunemp;
  String? _textfustud;
  String? _textstudying;
  String? _textstatus;
Screeninfo copyWith({  String? titleprofile,
  String? subtitlegeninfor,
  String? subtitlecont,
  String? subtitleeduinfo,
  String? subtitleaddress,
  String? subtitleworkinfo,
  String? textedit,
  String? textsave,
  String? textname,
  String? textlname,
  String? textnickname,
  String? textstdcode,
  String? textgen,
  String? texttel,
  String? textfac,
  String? textdepart,
  String? textmajor,
  String? textgpaju,
  String? textgpase,
  String? textgpaba,
  String? texthousenumber,
  String? textmoo,
  String? textsoi,
  String? textroad,
  String? textsubdistrict,
  String? textdistrict,
  String? textprovince,
  String? textzipcode,
  String? subtitleworkplace,
  String? textcomp,
  String? textatt,
  String? textcareer,
  String? textJobtype,
  String? textemp,
  String? textunemp,
  String? textfustud,
  String? textstudying,
  String? textstatus,
}) => Screeninfo(  titleprofile: titleprofile ?? _titleprofile,
  subtitlegeninfor: subtitlegeninfor ?? _subtitlegeninfor,
  subtitlecont: subtitlecont ?? _subtitlecont,
  subtitleeduinfo: subtitleeduinfo ?? _subtitleeduinfo,
  subtitleaddress: subtitleaddress ?? _subtitleaddress,
  subtitleworkinfo: subtitleworkinfo ?? _subtitleworkinfo,
  textedit: textedit ?? _textedit,
  textsave: textsave ?? _textsave,
  textname: textname ?? _textname,
  textlname: textlname ?? _textlname,
  textnickname: textnickname ?? _textnickname,
  textstdcode: textstdcode ?? _textstdcode,
  textgen: textgen ?? _textgen,
  texttel: texttel ?? _texttel,
  textfac: textfac ?? _textfac,
  textdepart: textdepart ?? _textdepart,
  textmajor: textmajor ?? _textmajor,
  textgpaju: textgpaju ?? _textgpaju,
  textgpase: textgpase ?? _textgpase,
  textgpaba: textgpaba ?? _textgpaba,
  texthousenumber: texthousenumber ?? _texthousenumber,
  textmoo: textmoo ?? _textmoo,
  textsoi: textsoi ?? _textsoi,
  textroad: textroad ?? _textroad,
  textsubdistrict: textsubdistrict ?? _textsubdistrict,
  textdistrict: textdistrict ?? _textdistrict,
  textprovince: textprovince ?? _textprovince,
  textzipcode: textzipcode ?? _textzipcode,
  subtitleworkplace: subtitleworkplace ?? _subtitleworkplace,
  textcomp: textcomp ?? _textcomp,
  textatt: textatt ?? _textatt,
  textcareer: textcareer ?? _textcareer,
  textJobtype: textJobtype ?? _textJobtype,
  textemp: textemp ?? _textemp,
  textunemp: textunemp ?? _textunemp,
  textfustud: textfustud ?? _textfustud,
  textstudying: textstudying ?? _textstudying,
  textstatus: textstatus ?? _textstatus,
);
  String? get titleprofile => _titleprofile;
  String? get subtitlegeninfor => _subtitlegeninfor;
  String? get subtitlecont => _subtitlecont;
  String? get subtitleeduinfo => _subtitleeduinfo;
  String? get subtitleaddress => _subtitleaddress;
  String? get subtitleworkinfo => _subtitleworkinfo;
  String? get textedit => _textedit;
  String? get textsave => _textsave;
  String? get textname => _textname;
  String? get textlname => _textlname;
  String? get textnickname => _textnickname;
  String? get textstdcode => _textstdcode;
  String? get textgen => _textgen;
  String? get texttel => _texttel;
  String? get textfac => _textfac;
  String? get textdepart => _textdepart;
  String? get textmajor => _textmajor;
  String? get textgpaju => _textgpaju;
  String? get textgpase => _textgpase;
  String? get textgpaba => _textgpaba;
  String? get texthousenumber => _texthousenumber;
  String? get textmoo => _textmoo;
  String? get textsoi => _textsoi;
  String? get textroad => _textroad;
  String? get textsubdistrict => _textsubdistrict;
  String? get textdistrict => _textdistrict;
  String? get textprovince => _textprovince;
  String? get textzipcode => _textzipcode;
  String? get subtitleworkplace => _subtitleworkplace;
  String? get textcomp => _textcomp;
  String? get textatt => _textatt;
  String? get textcareer => _textcareer;
  String? get textJobtype => _textJobtype;
  String? get textemp => _textemp;
  String? get textunemp => _textunemp;
  String? get textfustud => _textfustud;
  String? get textstudying => _textstudying;
  String? get textstatus => _textstatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleprofile'] = _titleprofile;
    map['subtitlegeninfor'] = _subtitlegeninfor;
    map['subtitlecont'] = _subtitlecont;
    map['subtitleeduinfo'] = _subtitleeduinfo;
    map['subtitleaddress'] = _subtitleaddress;
    map['subtitleworkinfo'] = _subtitleworkinfo;
    map['textedit'] = _textedit;
    map['textsave'] = _textsave;
    map['textname'] = _textname;
    map['textlname'] = _textlname;
    map['textnickname'] = _textnickname;
    map['textstdcode'] = _textstdcode;
    map['textgen'] = _textgen;
    map['texttel'] = _texttel;
    map['textfac'] = _textfac;
    map['textdepart'] = _textdepart;
    map['textmajor'] = _textmajor;
    map['textgpaju'] = _textgpaju;
    map['textgpase'] = _textgpase;
    map['textgpaba'] = _textgpaba;
    map['texthousenumber'] = _texthousenumber;
    map['textmoo'] = _textmoo;
    map['textsoi'] = _textsoi;
    map['textroad'] = _textroad;
    map['textsubdistrict'] = _textsubdistrict;
    map['textdistrict'] = _textdistrict;
    map['textprovince'] = _textprovince;
    map['textzipcode'] = _textzipcode;
    map['subtitleworkplace'] = _subtitleworkplace;
    map['textcomp'] = _textcomp;
    map['textatt'] = _textatt;
    map['textcareer'] = _textcareer;
    map['textJobtype'] = _textJobtype;
    map['textemp'] = _textemp;
    map['textunemp'] = _textunemp;
    map['textfustud'] = _textfustud;
    map['textstudying'] = _textstudying;
    map['textstatus'] = _textstatus;
    return map;
  }

}

/// status : 200
/// message : "susccess"
/// module : "profile"

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