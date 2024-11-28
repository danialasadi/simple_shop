/*
{
  "user": {
    "userName": "ali",
    "name": "ali",
    "familly": "asadi"
  }
}
*/



//     این قسمت استفاده ای در اپلیکیشن ندارد ولی نمونه ی کلاس مدل و انتیتی رو به نمایش گذاشته




import 'package:artacode_test/Features/Login/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({super.user});



  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]));
  }








}




class User {
  String? userName;
  String? name;
  String? familly;

  User({this.userName, this.name, this.familly});

  User.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    name = json["name"];
    familly = json["familly"];
  }

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userName"] = userName;
    _data["name"] = name;
    _data["familly"] = familly;
    return _data;
  }
}
