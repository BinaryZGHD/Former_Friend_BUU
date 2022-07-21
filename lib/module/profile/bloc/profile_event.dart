part of 'profile_bloc.dart';

// @immutable
abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {}

class SaveProfileChanges extends ProfileEvent {}

//----------------------------------API---------------------------------------//
class ProfileApiEvent extends ProfileEvent {
  ProfileApiEvent();
}

class ProfileGeneralSummitEvent extends ProfileEvent {
  bool istextbuttonpressed;
  ProfileGeneralSummitEvent({required this.istextbuttonpressed});
}

class ProfileGeneralUpdateEvent extends ProfileEvent {
  String name;
  String surname;
  String nickname;
  String stuCode;
  String gen;
  ProfileGeneralUpdateEvent(
      {required this.name,
      required this.surname,
      required this.nickname,
      required this.stuCode,
      required this.gen});
}

class GeneralSubmitEvent extends ProfileEvent {
  String name;
  String surname;
  String nickname;
  GeneralSubmitEvent({
    required this.name,
    required this.surname,
    required this.nickname,
  });
}

class EducationSubmitEvent extends ProfileEvent {
  String gpaJh;
  String gpaSh;
  String gpaBd;
  EducationSubmitEvent(
      {
      required this.gpaJh,
      required this.gpaSh,
      required this.gpaBd});
}

class AddressSubmitEvent extends ProfileEvent {
  String number;
  String road;
  String subDistrict;
  String district;
  String province;
  String zipcode;
  AddressSubmitEvent(
      {
      required this.number,
      required this.road,
      required this.subDistrict,
      required this.district,
      required this.province,
      required this.zipcode});
}

class ContactSubmitEvent extends ProfileEvent {
  String phone;
  String line;
  String facebook;
  String instragram;
  String twitter;
  String youtube;
  ContactSubmitEvent(
      {
      required this.phone,
      required this.line,
      required this.facebook,
      required this.instragram,
      required this.twitter,
      required this.youtube});
}

class CareerSubmitEvent extends ProfileEvent {
  String attention;
  String status;
  String jobType;
  String career;
  String company;
  String workplace;
  CareerSubmitEvent(
      {required this.attention,
        required this.status,
        required this.jobType,
        required this.career,
        required this.company,
        required this.workplace});
}
