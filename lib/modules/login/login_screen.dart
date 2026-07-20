import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda/modules/login/bloc/login_bloc.dart';
import 'package:pda/modules/login/bloc/login_state.dart';
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
          body: BlocListener<LoginBloc,LoginState>(
              listener: (context,state){
                print("Listener: ${state.runtimeType}");
                if(state is LoginFailure){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Oh no!"),
                        content: Text(state.errorMessage),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );}

                if(state is LoginSuccess){
                  Navigator.pushReplacementNamed(context, "Otpscreen");
                }

              },
              child: Column(
              children: [
              LoginForm()
          ],
        ),),
        ),
      ),
    );
  }
}
