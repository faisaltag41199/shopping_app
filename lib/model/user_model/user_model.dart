import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId:2)
class UserModel{

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? userId;

  @HiveField(3)
  String? image;

  UserModel({this.name,this.email,this.userId,this.image});

  UserModel.fromJson(Map<dynamic,dynamic> jsonData){

    if(jsonData==null) return ;

    name=jsonData['name'];
    email=jsonData['email'];
    userId=jsonData['userId'];
    image=jsonData['image'];

  }
  toJson(){

    return {
      'name':name,
      'email':email,
      'userId':userId,
      'image':image,
    };
  }

}

