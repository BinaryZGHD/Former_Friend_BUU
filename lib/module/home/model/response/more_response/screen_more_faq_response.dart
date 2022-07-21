import 'dart:convert';
/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"titleafq":"FAQ","textquestion":"Question","textanswer":"Answer"},"faq":[{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"}]}

ScreenMoreFAQResponse screenMoreFAQResponseFromJson(String str) => ScreenMoreFAQResponse.fromJson(json.decode(str));
String screenMoreFAQResponseToJson(ScreenMoreFAQResponse data) => json.encode(data.toJson());
class ScreenMoreFAQResponse {
  ScreenMoreFAQResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  ScreenMoreFAQResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreFAQResponse copyWith({  Head? head,
    Body? body,
  }) => ScreenMoreFAQResponse(  head: head ?? _head,
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

/// screeninfo : {"titleafq":"FAQ","textquestion":"Question","textanswer":"Answer"}
/// faq : [{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    List<Faq>? faq,}){
    _screeninfo = screeninfo;
    _faq = faq;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['faq'] != null) {
      _faq = [];
      json['faq'].forEach((v) {
        _faq?.add(Faq.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Faq>? _faq;
  Body copyWith({  Screeninfo? screeninfo,
    List<Faq>? faq,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    faq: faq ?? _faq,
  );
  Screeninfo? get screeninfo => _screeninfo;
  List<Faq>? get faq => _faq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_faq != null) {
      map['faq'] = _faq?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// question : "Question"
/// answer : "Answer"

Faq faqFromJson(String str) => Faq.fromJson(json.decode(str));
String faqToJson(Faq data) => json.encode(data.toJson());
class Faq {
  Faq({
    String? question,
    String? answer,}){
    _question = question;
    _answer = answer;
  }

  Faq.fromJson(dynamic json) {
    _question = json['question'];
    _answer = json['answer'];
  }
  String? _question;
  String? _answer;
  Faq copyWith({  String? question,
    String? answer,
  }) => Faq(  question: question ?? _question,
    answer: answer ?? _answer,
  );
  String? get question => _question;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }

}

/// titleafq : "FAQ"
/// textquestion : "Question"
/// textanswer : "Answer"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? titleafq,
    String? textquestion,
    String? textanswer,}){
    _titleafq = titleafq;
    _textquestion = textquestion;
    _textanswer = textanswer;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleafq = json['titleafq'];
    _textquestion = json['textquestion'];
    _textanswer = json['textanswer'];
  }
  String? _titleafq;
  String? _textquestion;
  String? _textanswer;
  Screeninfo copyWith({  String? titleafq,
    String? textquestion,
    String? textanswer,
  }) => Screeninfo(  titleafq: titleafq ?? _titleafq,
    textquestion: textquestion ?? _textquestion,
    textanswer: textanswer ?? _textanswer,
  );
  String? get titleafq => _titleafq;
  String? get textquestion => _textquestion;
  String? get textanswer => _textanswer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleafq'] = _titleafq;
    map['textquestion'] = _textquestion;
    map['textanswer'] = _textanswer;
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