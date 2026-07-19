abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent{
  final String salesmanId;
  final String password;

  LoginButtonPressed({
    required this.salesmanId,
    required this.password
});
}

