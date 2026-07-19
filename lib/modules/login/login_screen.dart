import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda/modules/login/bloc/login_bloc.dart';
import 'package:pda/modules/login/login_form.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BlocProvider(
        create: (_) => LoginBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Title"),
          ),
          body: LoginForm(),
        ),
      ),
    );
  }
}
