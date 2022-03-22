import 'package:bloc/bloc.dart';
import 'package:ebook_app/modules/authentication/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../network/loacal/cache_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = true;

  IconData sufIcon = Icons.visibility_outlined;


  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    sufIcon = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(PasswordChangeVisibility());
  }

  void userLogin({required String email, required String password})async {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      emit(LoginSuccessState());
    }).catchError((onError){
      emit(LoginOnErrorState(error: onError.toString()));
    });
  }
}
