import 'package:flutter/material.dart';
import 'package:pda_app/app/routes/route_names.dart';
import 'package:pda_app/common/models/user_model.dart';
import  'package:pda_app/modules/login/widgets/auth_object.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final TextEditingController salesmanIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    salesmanIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future <void> submitForm() async{
      print("Login button pressed");
    if (formKey.currentState!.validate()) {

      UserModel? user = await authService.login(salesmanId:  salesmanIdController.text,password:  passwordController.text);

      if(user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Salesman ID or Password"),
            ));
      }else{

        Navigator.pushNamed(
          context,
          RouteNames.otp,
          arguments: user,
        );
      }

    }}
    return
       Scaffold(
        body:   Column(
          children: [
            SizedBox(height: 100),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "Enter Salesman ID";
                      }
                      else if(int.tryParse(value) == null ){
                        return "Incorrect ID";
                      }
                      else{
                        return null;
                      }
                    },
                    controller: salesmanIdController,
                    decoration: const InputDecoration(
                      labelText: 'Salesman ID',
                      prefixIcon: Icon(Icons.person),
                    ),

                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(onPressed: submitForm, child: Text("LOGIN"))
                ],
              ),

            ),
          ],
        )
        ,
      );

  }
}
