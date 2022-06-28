import 'dart:convert';

ScreenHomeMoreBoardTeacherResponse screenHomeMoreBoardTeacherResponseFromJson(String str) => ScreenHomeMoreBoardTeacherResponse.fromJson(json.decode(str));
String screenHomeMoreBoardTeacherResponseToJson(ScreenHomeMoreBoardTeacherResponse data) => json.encode(data.toJson());

class ScreenHomeMoreBoardTeacherResponse {
  ScreenHomeMoreBoardTeacherResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  ScreenHomeMoreBoardTeacherResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenHomeMoreBoardTeacherResponse copyWith({  Head? head,
    Body? body,
  }) => ScreenHomeMoreBoardTeacherResponse(  head: head ?? _head,
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

/// screeninfo : {"titlenisit":"Board of Teacher","departone":"Mathematics","departtwo":"Statistics","teacher":"Teacher","staff":"Staff","name":"Name","position":"Position","phone":"Phone","email":"Email","img_depart":"http://science.buu.ac.th/newweb/img/20200513210003.jpg"}
/// teacher : {"teacherone":[{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"ณัฏฐ์ธนัญ - ปราชญ์ผู้มีทรัพย์และอื่นๆง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"นัทธ์ธัญธนิน - ผูกพันกับความโชคดีและร่ำรวย","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"}],"teachertwo":[{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats ณัฏฐ์ธนัญ - ปราชญ์ผู้มีทรัพย์และอื่นๆง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats นัทธ์ธัญธนิน - ผูกพันกับความโชคดีและร่ำรวย","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"}]}
/// staff : [{"name":"เทวทิณณ์ - เทพประทาน","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤชฐารวี - มีอาวุธที่มั่นคงดั่งพระอาทิตย์","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    Teacher? teacher,
    List<Staff>? staff,}){
    _screeninfo = screeninfo;
    _teacher = teacher;
    _staff = staff;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    if (json['staff'] != null) {
      _staff = [];
      json['staff'].forEach((v) {
        _staff?.add(Staff.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  Teacher? _teacher;
  List<Staff>? _staff;
  Body copyWith({  Screeninfo? screeninfo,
    Teacher? teacher,
    List<Staff>? staff,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    teacher: teacher ?? _teacher,
    staff: staff ?? _staff,
  );
  Screeninfo? get screeninfo => _screeninfo;
  Teacher? get teacher => _teacher;
  List<Staff>? get staff => _staff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_teacher != null) {
      map['teacher'] = _teacher?.toJson();
    }
    if (_staff != null) {
      map['staff'] = _staff?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "เทวทิณณ์ - เทพประทาน"
/// position : "professor"
/// phone : "098-765-4321"
/// email : "Emailnameposition1@go.buu.ac.th"
/// img_teacher : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));
String staffToJson(Staff data) => json.encode(data.toJson());
class Staff {
  Staff({
    String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,}){
    _name = name;
    _position = position;
    _phone = phone;
    _email = email;
    _imgTeacher = imgTeacher;
  }

  Staff.fromJson(dynamic json) {
    _name = json['name'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _imgTeacher = json['img_teacher'];
  }
  String? _name;
  String? _position;
  String? _phone;
  String? _email;
  String? _imgTeacher;
  Staff copyWith({  String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,
  }) => Staff(  name: name ?? _name,
    position: position ?? _position,
    phone: phone ?? _phone,
    email: email ?? _email,
    imgTeacher: imgTeacher ?? _imgTeacher,
  );
  String? get name => _name;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get imgTeacher => _imgTeacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img_teacher'] = _imgTeacher;
    return map;
  }

}

/// teacherone : [{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"ณัฏฐ์ธนัญ - ปราชญ์ผู้มีทรัพย์และอื่นๆง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"นัทธ์ธัญธนิน - ผูกพันกับความโชคดีและร่ำรวย","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"}]
/// teachertwo : [{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats ณัฏฐ์ธนัญ - ปราชญ์ผู้มีทรัพย์และอื่นๆง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats นัทธ์ธัญธนิน - ผูกพันกับความโชคดีและร่ำรวย","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats กฤษฎาภาส - การกระทำที่รุ่งเรือง","position":"professor","phone":"098-765-4321","email":"Emailnameposition1@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"},{"name":"stats สิรินธิบดิ์ชญา - มีมงคลเป็นใหญ่และมีความรู้","position":"professor","phone":"098-765-4321","email":"Emailnameposition2@go.buu.ac.th","img_teacher":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"}]

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));
String teacherToJson(Teacher data) => json.encode(data.toJson());
class Teacher {
  Teacher({
    List<Teacherone>? teacherone,
    List<Teachertwo>? teachertwo,}){
    _teacherone = teacherone;
    _teachertwo = teachertwo;
  }

  Teacher.fromJson(dynamic json) {
    if (json['teacherone'] != null) {
      _teacherone = [];
      json['teacherone'].forEach((v) {
        _teacherone?.add(Teacherone.fromJson(v));
      });
    }
    if (json['teachertwo'] != null) {
      _teachertwo = [];
      json['teachertwo'].forEach((v) {
        _teachertwo?.add(Teachertwo.fromJson(v));
      });
    }
  }
  List<Teacherone>? _teacherone;
  List<Teachertwo>? _teachertwo;
  Teacher copyWith({  List<Teacherone>? teacherone,
    List<Teachertwo>? teachertwo,
  }) => Teacher(  teacherone: teacherone ?? _teacherone,
    teachertwo: teachertwo ?? _teachertwo,
  );
  List<Teacherone>? get teacherone => _teacherone;
  List<Teachertwo>? get teachertwo => _teachertwo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_teacherone != null) {
      map['teacherone'] = _teacherone?.map((v) => v.toJson()).toList();
    }
    if (_teachertwo != null) {
      map['teachertwo'] = _teachertwo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "stats กฤษฎาภาส - การกระทำที่รุ่งเรือง"
/// position : "professor"
/// phone : "098-765-4321"
/// email : "Emailnameposition1@go.buu.ac.th"
/// img_teacher : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"

Teachertwo teachertwoFromJson(String str) => Teachertwo.fromJson(json.decode(str));
String teachertwoToJson(Teachertwo data) => json.encode(data.toJson());
class Teachertwo {
  Teachertwo({
    String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,}){
    _name = name;
    _position = position;
    _phone = phone;
    _email = email;
    _imgTeacher = imgTeacher;
  }

  Teachertwo.fromJson(dynamic json) {
    _name = json['name'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _imgTeacher = json['img_teacher'];
  }
  String? _name;
  String? _position;
  String? _phone;
  String? _email;
  String? _imgTeacher;
  Teachertwo copyWith({  String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,
  }) => Teachertwo(  name: name ?? _name,
    position: position ?? _position,
    phone: phone ?? _phone,
    email: email ?? _email,
    imgTeacher: imgTeacher ?? _imgTeacher,
  );
  String? get name => _name;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get imgTeacher => _imgTeacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img_teacher'] = _imgTeacher;
    return map;
  }

}

/// name : "กฤษฎาภาส - การกระทำที่รุ่งเรือง"
/// position : "professor"
/// phone : "098-765-4321"
/// email : "Emailnameposition1@go.buu.ac.th"
/// img_teacher : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"

Teacherone teacheroneFromJson(String str) => Teacherone.fromJson(json.decode(str));
String teacheroneToJson(Teacherone data) => json.encode(data.toJson());
class Teacherone {
  Teacherone({
    String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,}){
    _name = name;
    _position = position;
    _phone = phone;
    _email = email;
    _imgTeacher = imgTeacher;
  }

  Teacherone.fromJson(dynamic json) {
    _name = json['name'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _imgTeacher = json['img_teacher'];
  }
  String? _name;
  String? _position;
  String? _phone;
  String? _email;
  String? _imgTeacher;
  Teacherone copyWith({  String? name,
    String? position,
    String? phone,
    String? email,
    String? imgTeacher,
  }) => Teacherone(  name: name ?? _name,
    position: position ?? _position,
    phone: phone ?? _phone,
    email: email ?? _email,
    imgTeacher: imgTeacher ?? _imgTeacher,
  );
  String? get name => _name;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get imgTeacher => _imgTeacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img_teacher'] = _imgTeacher;
    return map;
  }

}

/// titlenisit : "Board of Teacher"
/// departone : "Mathematics"
/// departtwo : "Statistics"
/// teacher : "Teacher"
/// staff : "Staff"
/// name : "Name"
/// position : "Position"
/// phone : "Phone"
/// email : "Email"
/// img_depart : "http://science.buu.ac.th/newweb/img/20200513210003.jpg"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? titlenisit,
    String? departone,
    String? departtwo,
    String? teacher,
    String? staff,
    String? name,
    String? position,
    String? phone,
    String? email,
    String? imgDepart,}){
    _titlenisit = titlenisit;
    _departone = departone;
    _departtwo = departtwo;
    _teacher = teacher;
    _staff = staff;
    _name = name;
    _position = position;
    _phone = phone;
    _email = email;
    _imgDepart = imgDepart;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlenisit = json['titlenisit'];
    _departone = json['departone'];
    _departtwo = json['departtwo'];
    _teacher = json['teacher'];
    _staff = json['staff'];
    _name = json['name'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _imgDepart = json['img_depart'];
  }
  String? _titlenisit;
  String? _departone;
  String? _departtwo;
  String? _teacher;
  String? _staff;
  String? _name;
  String? _position;
  String? _phone;
  String? _email;
  String? _imgDepart;
  Screeninfo copyWith({  String? titlenisit,
    String? departone,
    String? departtwo,
    String? teacher,
    String? staff,
    String? name,
    String? position,
    String? phone,
    String? email,
    String? imgDepart,
  }) => Screeninfo(  titlenisit: titlenisit ?? _titlenisit,
    departone: departone ?? _departone,
    departtwo: departtwo ?? _departtwo,
    teacher: teacher ?? _teacher,
    staff: staff ?? _staff,
    name: name ?? _name,
    position: position ?? _position,
    phone: phone ?? _phone,
    email: email ?? _email,
    imgDepart: imgDepart ?? _imgDepart,
  );
  String? get titlenisit => _titlenisit;
  String? get departone => _departone;
  String? get departtwo => _departtwo;
  String? get teacher => _teacher;
  String? get staff => _staff;
  String? get name => _name;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get imgDepart => _imgDepart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlenisit'] = _titlenisit;
    map['departone'] = _departone;
    map['departtwo'] = _departtwo;
    map['teacher'] = _teacher;
    map['staff'] = _staff;
    map['name'] = _name;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img_depart'] = _imgDepart;
    return map;
  }

}

/// status : "200"
/// message : "success"
/// module : "home"

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