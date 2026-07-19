import 'package:pda/common/models/user_model.dart';

class LoginResult {
  final bool success;
  final UserModel? user;
  final String? message;

  LoginResult({
    required this.success,
    this.user,
    this.message,
  });
}