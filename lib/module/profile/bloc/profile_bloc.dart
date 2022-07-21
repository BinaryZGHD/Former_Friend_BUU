import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:f2fbuu/module/profile/model/response/address.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/model/response/career.dart';
import 'package:f2fbuu/module/profile/model/response/education.dart';
import 'package:f2fbuu/module/profile/model/response/general.dart';
import 'package:f2fbuu/module/profile/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
        Response response = await getApiProfile();
        emit(ProfileLoadingSuccess());
        if (response.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(response.data);
          if (apiProfileResponse.head?.status == 200) {
            emit(ProfileApiSuccessState(response: apiProfileResponse));
          } else {
            emit(ProfileError(errorMessage: apiProfileResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );
    on<ChangeAvatarRequest>((event, emit) async{
      if (event is ChangeAvatarRequest) {
        if (kDebugMode) {
          print('Change avatar request');
        }
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        emit(ChooseAvatarSuccess(avatarImage: imageTemp));
        if (kDebugMode) {
          print(imageTemp);
        }
        // emit(ChangeAvatarProcress());
      }


    }
    );
    on<GeneralSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseGeneralSubmit = await sentProfileGeneralData(
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
            emit(ProfileError(errorMessage: generalResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseGeneralSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<EducationSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseEducationSubmit = await sentProfileEducationData(
            event.gpaJh,
            event.gpaSh,
            event.gpaBd);
        emit(ProfileLoadingSuccess());
        if (responseEducationSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          EducationResponse educationResponse = EducationResponse.fromJson(responseEducationSubmit.data);
          if (educationResponse.head?.status == 200) {
            emit(EducationSubmitSuccessState(responseEducation: educationResponse));
          } else {
            emit(ProfileError(errorMessage: educationResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseEducationSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<AddressSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseAddressSubmit = await sentProfileAddressData(
            event.number,
            event.road,
            event.subDistrict,
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
            emit(ProfileError(errorMessage: addressResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseAddressSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<ContactSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseContactSubmit = await sentProfileContactData(
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
            emit(ProfileError(errorMessage: contactResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseContactSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );

    on<CareerSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseCareerSubmit = await sentProfileCareerData(
            event.attention,
            event.status,
            event.jobType,
            event.career,
            event.company,
            event.workplace
        );
        emit(ProfileLoadingSuccess());
        if (responseCareerSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          CareerResponse careerResponse = CareerResponse.fromJson(responseCareerSubmit.data);
          if (careerResponse.head?.status == 200) {
            emit(CareerSubmitSuccessState(responseCareer: careerResponse));
          } else {
            emit(ProfileError(errorMessage: careerResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseCareerSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
  }
}
