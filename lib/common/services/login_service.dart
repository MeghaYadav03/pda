import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:pda/common/models/user_model.dart';
import 'package:pda/modules/login/login_result.dart';

class LoginService {
  Future<LoginResult> auth (
  {required String salesmanId, required String password}
      ) async

  {
    String jsonString = await rootBundle.loadString('assets/mock_data/users.json');
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> userList = jsonDecode(jsonString);

    List <UserModel> users = userList.map((e) => UserModel.fromJson(
       e as Map<String,dynamic>)).toList();

    UserModel? user;

     user = users.firstWhereOrNull((e)=> e.salesmanId==salesmanId);

     if(user==null){
       print("No User Found");
       return LoginResult(success: false,message: "No User Found");
     }
     else if(user.password!=password){
       print("Incorrect Password");
       return LoginResult(success: false,message: "Incorrect Password");

     }
     else if(!user.isActive){
       print("User is Inactive");
       return LoginResult(success: false,message: "User is Inactive");

     }
     else {
       return LoginResult(success: true,user: user);
     }
  }
}