import 'package:pda/common/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  UserModel user;
  LoginSuccess({required this.user});
}
class LoginFailure extends LoginState {
  String errorMessage;

  LoginFailure({required this.errorMessage});
}
