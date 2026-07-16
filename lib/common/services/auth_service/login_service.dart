import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pda_app/common/models/user_model.dart';
import 'package:collection/collection.dart';
class AuthService {

  Future<UserModel?> login({
    required String salesmanId,
    required String password,
  }) async {

    String jsonString =
    await rootBundle.loadString('assets/mock/user.json');

    // await ( temp = jsonEncode(lib/assets/mock/user.json).toList());

    List<dynamic> temp = jsonDecode(jsonString);
    List <UserModel> users = temp.map((e)=>
        UserModel.fromJson(e as Map<String,dynamic>)
    ).toList();

    UserModel ? user;

    user = users.firstWhereOrNull((e)=>e.salesmanId == salesmanId);

    if(user != null && user.password ==password && user.isActive==true ){
      print(user);
      return user;
    }
    else{
      return null;
    }
  }

}
