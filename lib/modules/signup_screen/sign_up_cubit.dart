import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/plant_user_model/plant_user_model.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  changePasswordVisability() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpRegisterChangePasswordVisabilityState());
  }

  Future<void> userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(SignupErrorState(error.toString()));
      print(error.toString());
    });
  }
  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    PlantUserAppModel model = PlantUserAppModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image: '',
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SignupCreateUserSuccessState());
    }).catchError((error) {
      emit(SignupCreateUserErrorState(error.toString()));
    });
  }
}
