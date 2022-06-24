import 'dart:convert';
/// head : {"status":"200","message":"susccess","module":"profile"}
/// body : {"screeninfo":{"titleprofile":"Profile","subtitlegeninfor":"General information","subtitlecont":"Contact","subtitleeduinfo":"Education information","subtitleaddress":"Address","subtitleworkinfo":"Career","textedit":"Edit","textsave":"Save","textname":"Name","textlname":"Lastname","textnickname":"Nickname","textstdcode":"Student code","textgen":"Generation","texttel":"Tel","textfac":"Faculty","textdepart":"Department","textmajor":"Major","textgpaju":"GPA (Junior high school)","textgpase":"GPA (Senior high school)","textgpaba":"GPA (Bachelor degree)","texthousenumber":"House no.","textmoo":"Moo","textsoi":"Soi","textroad":"Road","textsubdistrict":"Subdistrict","textdistrict":"District","textprovince":"Province","textzipcode":"Zip code","subtitleworkplace":"Work place","textcomp":"Company","textatt":"Attention","textcareer":"Career","textJobtype":"Job type ","textemp":"Employed","textunemp":"Unemployed","textfustud":"Futher study","textstudying":"Studying","textstatus":"Status","profile_career_screeninfo":{"attention":[{"attenname":"อื่นๆ"},{"attenname":"คอมพิวเตอร์ "},{"attenname":"ครู"},{"attenname":"ประกันภัย"},{"attenname":"สถิติ"},{"attenname":"ค้าขาย"},{"attenname":"อื่นๆ ครับ"}],"status":[{"statusname":"อื่นๆ"},{"statusname":"ศึกษาต่อ"},{"statusname":"ว่างงาน"},{"statusname":"มีงานทำ"},{"statusname":"กำลังจะมีงานทำ"},{"statusname":"อื่นๆ ครับครับ"}],"jobtype":[{"jobname":"0"},{"jobname":"1"},{"jobname":"2"},{"jobname":"อื่นๆ"},{"jobname":"อื่นๆ ครับครับครับ"}]}},"profile_general_info":{"name":"คณิศาสตร์","surname":"สถิติวิชาการ","nickname":"AKA คำฝอย","stu_code":"6203XXXXX","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"},"profile_edu_info":{"faculty":"Science","department":"Mathematics","major":" Math","gpa_bd":"4.00 ","gpa_jhs":"4.00","gpa_shs":"4.00"},"profile_address_info":{"number":"156/4","moo":"-","soi":"-","road":"-","subdistrict":"-","district":"-","province":"-","zipcode":"12345"},"profile_contact_info":{"phone":"085-123-4567","line":"@scimath","facebook":"scimathface","instagram":"scimathig","twitter":"scimathtwitter","youtube":"scimathutube"},"profile_career_info":{"company":"Burapha company","attention":"อื่นๆ","status":"ว่างงาน","jobtype":"อื่นๆ","userworkplace":"BURAPHA Univer ครับ","usercareer":"Developer ครับ","usercompany":"Burapha company ครับ","userattention":"อื่นๆ ครับ","userstatus":"อื่นๆ ครับครับ","userjobtype":"อื่นๆ ครับครับครับ"}}

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

/// screeninfo : {"titleprofile":"Profile","subtitlegeninfor":"General information","subtitlecont":"Contact","subtitleeduinfo":"Education information","subtitleaddress":"Address","subtitleworkinfo":"Career","textedit":"Edit","textsave":"Save","textname":"Name","textlname":"Lastname","textnickname":"Nickname","textstdcode":"Student code","textgen":"Generation","texttel":"Tel","textfac":"Faculty","textdepart":"Department","textmajor":"Major","textgpaju":"GPA (Junior high school)","textgpase":"GPA (Senior high school)","textgpaba":"GPA (Bachelor degree)","texthousenumber":"House no.","textmoo":"Moo","textsoi":"Soi","textroad":"Road","textsubdistrict":"Subdistrict","textdistrict":"District","textprovince":"Province","textzipcode":"Zip code","subtitleworkplace":"Work place","textcomp":"Company","textatt":"Attention","textcareer":"Career","textJobtype":"Job type ","textemp":"Employed","textunemp":"Unemployed","textfustud":"Futher study","textstudying":"Studying","textstatus":"Status","profile_career_screeninfo":{"attention":[{"attenname":"อื่นๆ"},{"attenname":"คอมพิวเตอร์ "},{"attenname":"ครู"},{"attenname":"ประกันภัย"},{"attenname":"สถิติ"},{"attenname":"ค้าขาย"},{"attenname":"อื่นๆ ครับ"}],"status":[{"statusname":"อื่นๆ"},{"statusname":"ศึกษาต่อ"},{"statusname":"ว่างงาน"},{"statusname":"มีงานทำ"},{"statusname":"กำลังจะมีงานทำ"},{"statusname":"อื่นๆ ครับครับ"}],"jobtype":[{"jobname":"0"},{"jobname":"1"},{"jobname":"2"},{"jobname":"อื่นๆ"},{"jobname":"อื่นๆ ครับครับครับ"}]}}
/// profile_general_info : {"name":"คณิศาสตร์","surname":"สถิติวิชาการ","nickname":"AKA คำฝอย","stu_code":"6203XXXXX","gen":"X6","genname":"กรีนทีมัทฉะลาเต้","gencolor":"#9ED9C5","studentid":"6203XXXXX","email":"StudentCodeID@morebuu.ac.th","role":"Student","img":"https://yt3.ggpht.com/ytc/AKedOLTXeB8sshQ0AhZ-1HO4OSR37QHjsXtyXWLf7ZYi=s900-c-k-c0x00ffffff-no-rj"}
/// profile_edu_info : {"faculty":"Science","department":"Mathematics","major":" Math","gpa_bd":"4.00 ","gpa_jhs":"4.00","gpa_shs":"4.00"}
/// profile_address_info : {"number":"156/4","moo":"-","soi":"-","road":"-","subdistrict":"-","district":"-","province":"-","zipcode":"12345"}
/// profile_contact_info : {"phone":"085-123-4567","line":"@scimath","facebook":"scimathface","instagram":"scimathig","twitter":"scimathtwitter","youtube":"scimathutube"}
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
      ProfileCareerInfo? profileCareerInfo,}){
    _screeninfo = screeninfo;
    _profileGeneralInfo = profileGeneralInfo;
    _profileEduInfo = profileEduInfo;
    _profileAddressInfo = profileAddressInfo;
    _profileContactInfo = profileContactInfo;
    _profileCareerInfo = profileCareerInfo;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _profileGeneralInfo = json['profile_general_info'] != null ? ProfileGeneralInfo.fromJson(json['profile_general_info']) : null;
    _profileEduInfo = json['profile_edu_info'] != null ? ProfileEduInfo.fromJson(json['profile_edu_info']) : null;
    _profileAddressInfo = json['profile_address_info'] != null ? ProfileAddressInfo.fromJson(json['profile_address_info']) : null;
    _profileContactInfo = json['profile_contact_info'] != null ? ProfileContactInfo.fromJson(json['profile_contact_info']) : null;
    _profileCareerInfo = json['profile_career_info'] != null ? ProfileCareerInfo.fromJson(json['profile_career_info']) : null;
  }
  Screeninfo? _screeninfo;
  ProfileGeneralInfo? _profileGeneralInfo;
  ProfileEduInfo? _profileEduInfo;
  ProfileAddressInfo? _profileAddressInfo;
  ProfileContactInfo? _profileContactInfo;
  ProfileCareerInfo? _profileCareerInfo;
Body copyWith({  Screeninfo? screeninfo,
  ProfileGeneralInfo? profileGeneralInfo,
  ProfileEduInfo? profileEduInfo,
  ProfileAddressInfo? profileAddressInfo,
  ProfileContactInfo? profileContactInfo,
  ProfileCareerInfo? profileCareerInfo,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  profileGeneralInfo: profileGeneralInfo ?? _profileGeneralInfo,
  profileEduInfo: profileEduInfo ?? _profileEduInfo,
  profileAddressInfo: profileAddressInfo ?? _profileAddressInfo,
  profileContactInfo: profileContactInfo ?? _profileContactInfo,
  profileCareerInfo: profileCareerInfo ?? _profileCareerInfo,
);
  Screeninfo? get screeninfo => _screeninfo;
  ProfileGeneralInfo? get profileGeneralInfo => _profileGeneralInfo;
  ProfileEduInfo? get profileEduInfo => _profileEduInfo;
  ProfileAddressInfo? get profileAddressInfo => _profileAddressInfo;
  ProfileContactInfo? get profileContactInfo => _profileContactInfo;
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

ProfileCareerInfo profileCareerI