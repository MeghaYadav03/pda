// "salesmanId": "100004",
// "password": "field@123",
// "name": "Amit Patel",
// "employeeCode": "EMP100004",

// "mobileNumber": "9876543213",
// "isActive":

// import 'package:flutter/foundation.dart';


class UserModel {
  String salesmanId;
  String password;
  String name;
  String employeeCode;
  String mobileNumber;
  bool isActive;

  UserModel({
  required this.salesmanId,
  required this.password,
  required this.name,
  required this.employeeCode,
  required this.mobileNumber,
  required this.isActive
});

  factory UserModel.fromJson(
Map<String,dynamic> json
){
    return UserModel(
    salesmanId: json['salesmanId'],
    password: json['password'],
name: json['name'],
employeeCode: json['employeeCode'],
mobileNumber: json['mobileNumber'],
isActive: json['isActive'],
    );
}

Map<String,dynamic> toJson(){
    return{
      'salesmanId': salesmanId,
      'password': password,
'name': name,
'employeeCode': employeeCode,
'mobileNumber': mobileNumber,
'isActive': isActive
};
}
}