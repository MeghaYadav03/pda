// {
// "salesmanId": "100001",
// "password": "1234",
// "name": "Megha Yadav",
// "mobileNumber": "9876543210",
// "designation": "Sales Representative",
// "headquarter": "Mumbai",
// "isActive": true
// },
class UserModel {
  final String salesmanId;
  final String password;
  final String name;
  final String mobileNumber;
  final String headquarter;
  final bool isActive;

  UserModel({
    required this.salesmanId,
    required this.password,
    required this.name,
    required this.mobileNumber,
    required this.headquarter,
    required this.isActive
});
//FOR GET
  factory UserModel.fromJson(
      Map<String,dynamic> json
      ){
    return UserModel(
      salesmanId: json["salesmanId"],
      password: json["password"],
      name: json["name"],
      mobileNumber: json["mobileNumber"],
      headquarter: json["headquarter"],
      isActive: json["isActive"],
    );
  }

  //for POST
  Map<String, dynamic> toJson() {
    return {
      "salesmanId": salesmanId,
      "password": password,
      "name": name,
      "mobileNumber": mobileNumber,
      "headquarter": headquarter,
      "isActive": isActive,
    };
  }

}