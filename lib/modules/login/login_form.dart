import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda/modules/login/bloc/login_state.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController salesmanIdController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  void dispose() {
    salesmanIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<LoginBloc>().add(
      LoginButtonPressed(salesmanId: salesmanIdController.text.trim(), password: passwordController.text)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 100),
          TextFormField(
            controller: salesmanIdController,
            decoration: const InputDecoration(
              labelText: "Salesman ID",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Salesman ID";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              }
              return null;
            },
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
        child: BlocBuilder<LoginBloc,LoginState>(
            builder: (context,state){
              print("Builder: ${state.runtimeType}");
              if(state is LoginLoading){
            print("BTN changed");
            return( ElevatedButton(
              onPressed: null,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),Text("Loading")
                ],
              ),
            ));
          }
          else
          {
            return
              ( ElevatedButton(
                onPressed: login,
                child: const Text("LOGIN"),
              ));}
},)
      )
        ],
      ),
    );
  }
}




