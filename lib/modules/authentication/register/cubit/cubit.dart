
import 'package:ebook_app/modules/authentication/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../models/user_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = true;
  bool rememberMe = false;
  IconData sufIcon = Icons.visibility_outlined;

  void checkBoxState(bool rememberMeState) {
    rememberMe = rememberMeState;
    emit(RegisterCheckBoxState());
  }

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    sufIcon = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(PasswordChangeRegisterVisibility());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(name: name, phone: phone, email: email, uId: value.user!.uid);
      emit(RegisterSuccessState(uId: value.user!.uid));
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
    });
  }

  void userCreate(
      {required String name,
      required String phone,
      required String email,
      required String uId,}) {
    UserModel user = UserModel(email: email, name: name, id: uId, phone: phone);
    FirebaseFirestore.instance
        .collection('User')
        .doc(uId)
        .set(user.toMap())
        .then((value) {
      emit(CreateSuccessState());
    }).catchError((onError) {
      emit(CreateErrorState(onError));
    });
  }
}
