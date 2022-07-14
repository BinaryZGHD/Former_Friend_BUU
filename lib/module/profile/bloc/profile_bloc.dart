import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:f2fbuu/module/profile/model/response/address.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/model/response/career.dart';
import 'package:f2fbuu/module/profile/model/response/education.dart';
import 'package:f2fbuu/module/profile/model/response/general.dart';
import 'package:f2fbuu/module/profile/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../model/response/contact.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with ProfileRepository {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileApiEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response response = await getApiProfile(event.language,event.token);
        emit(ProfileLoadingSuccess());
        if (response.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(response.data);
          if (apiProfileResponse.head?.status == 200) {
            emit(ProfileApiSuccessState(response: apiProfileResponse));
          } else {
            emit(ProfileError(errormessage: apiProfileResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }

    }
    );
    on<ChangeAvatarRequest>((event, emit) async{
      if (event is ChangeAvatarRequest) {
        print('Change avatar request');
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        emit(ChooseAvatarSuccess(avatarimg: imageTemp));
        print(imageTemp);
        // emit(ChangeAvatarProcress());
      }


    }
    );
    on<GeneralSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseGeneralSubmit = await sentProfileGeneralData(event.token,
            event.name,
            event.surname,
            event.nickname,
            "tel");
        emit(ProfileLoadingSuccess());
        if (responseGeneralSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          GeneralResponse generalResponse = GeneralResponse.fromJson(responseGeneralSubmit.data);
          if (generalResponse.head?.status == 200) {
            emit(GeneralSubmitSuccessState(responseGeneral: generalResponse));
          } else {
            emit(ProfileError(errormessage: generalResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: responseGeneralSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<EducationSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseEducationSubmit = await sentProfileEducationData(
            event.token,
            event.gpajh,
            event.gpash,
            event.gpabd);
        emit(ProfileLoadingSuccess());
        if (responseEducationSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          EducationResponse educationResponse = EducationResponse.fromJson(responseEducationSubmit.data);
          if (educationResponse.head?.status == 200) {
            emit(EducationSubmitSuccessState(responseEducation: educationResponse));
          } else {
            emit(ProfileError(errormessage: educationResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: responseEducationSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<AddressSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseAddressSubmit = await sentProfileAddressData(
            event.token,
            event.number,
            event.road,
            event.subdistrict,
            event.district,
            event.province,
            event.zipcode
        );
        emit(ProfileLoadingSuccess());
        if (responseAddressSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          AddressResponse addressResponse = AddressResponse.fromJson(responseAddressSubmit.data);
          if (addressResponse.head?.status == 200) {
            emit(AddressSubmitSuccessState(responseAddress: addressResponse));
          } else {
            emit(ProfileError(errormessage: addressResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: responseAddressSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<ContactSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseContactSubmit = await sentProfileContactData(
            event.token,
            event.phone,
            event.line,
            event.facebook,
            event.instragram,
            event.twitter,
            event.youtube
        );
        emit(ProfileLoadingSuccess());
        if (responseContactSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          ContactResponse contactResponse = ContactResponse.fromJson(responseContactSubmit.data);
          if (contactResponse.head?.status == 200) {
            emit(ContactSubmitSuccessState(responseContact: contactResponse));
          } else {
            emit(ProfileError(errormessage: contactResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: responseContactSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }
    }
    );

    on<CareerSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseCareerSubmit = await sentProfileCareerData(
            event.token,
            event.attention,
            event.status,
            event.jobtype,
            event.career,
            event.company
        );
        emit(ProfileLoadingSuccess());
        if (responseCareerSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          CareerResponse careerResponse = CareerResponse.fromJson(responseCareerSubmit.data);
          if (careerResponse.head?.status == 200) {
            emit(CareerSubmitSuccessState(responseCareer: careerResponse));
          } else {
            emit(ProfileError(errormessage: careerResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errormessage: responseCareerSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errormessage: e.response?.statusMessage ?? ""));
      }
    }
    );
  }
}
