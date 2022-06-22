class ScreenLoginResponse {
  Head? head;
  Body? body;

  ScreenLoginResponse({this.head, this.body});

  ScreenLoginResponse.fromJson(Map<String, dynamic> json) {
    head = json['head'] != null ?  Head.fromJson(json['head']) : null;
    body = json['body'] != null ?  Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (head != null) {
      data['head'] = head!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Head {
  String? status;
  String? message;
  String? modulename;

  Head({this.status, this.message, this.modulename});

  Head.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    modulename = json['modulename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['modulename'] = modulename;
    return data;
  }
}

class Body<T> {
  Screeninfo? screeninfo;

  Body({this.screeninfo});

  Body.fromJson(Map<String, dynamic> json) {
    screeninfo = json['screeninfo'] != null
        ?  Screeninfo.fromJson(json['screeninfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (screeninfo != null) {
      data['screeninfo'] = screeninfo!.toJson();
    }
    return data;
  }
}

class Screeninfo {
  String? btnchangelang;
  String? edtID;
  String? edtpass;
  String? btnlogin;
  String? btnforgotpass;
  String? textreg;
  String? btnReg;

  Screeninfo(
      {this.btnchangelang,
      this.edtID,
      this.edtpass,
      this.btnlogin,
      this.btnforgotpass,
      this.textreg,
      this.btnReg});

  Screeninfo.fromJson(Map<String, dynamic> json) {
    btnchangelang = json['btnchangelang'];
    edtID = json['edtID'];
    edtpass = json['edtpass'];
    btnlogin = json['btnlogin'];
    btnforgotpass = json['btnforgotpass'];
    textreg = json['textreg'];
    btnReg = json['btnReg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['btnchangelang'] = btnchangelang;
    data['edtID'] = edtID;
    data['edtpass'] = edtpass;
    data['btnlogin'] = btnlogin;
    data['btnforgotpass'] = btnforgotpass;
    data['textreg'] = textreg;
    data['btnReg'] = btnReg;
    return data;
  }
}