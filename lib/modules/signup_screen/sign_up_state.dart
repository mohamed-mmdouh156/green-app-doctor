part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignupLodingState extends SignUpState {}

class SignupSuccessState extends SignUpState {}

class SignupErrorState extends SignUpState {
  final String error;
  SignupErrorState(this.error);
}

class SignupCreateUserSuccessState extends SignUpState {
}

class SignupCreateUserErrorState extends SignUpState {
  final String error;

  SignupCreateUserErrorState(this.error);

}

class SignUpRegisterChangePasswordVisabilityState extends SignUpState {}
