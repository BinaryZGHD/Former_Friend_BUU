import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
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
          if (apiProfileResponse.head?.status == "200") {
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

  }
}
