import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../../constance.dart';
import '../../model/user_model/user_model.dart';

class ProfileController extends GetxController{

  Box _userBox=Hive.box<UserModel>('UserModel');
  UserModel? get userData => _getUserData();


  signOut()async{
   await GoogleSignIn().signOut();
   await FirebaseAuth.instance.signOut();
    _deleteUser();
  }

  setUser(UserModel userModel){
    _userBox.put(userKeyInHive,userModel);
  }

  UserModel? _getUserData() {
    return _userBox.get(userKeyInHive);
  }

  _deleteUser(){
    _userBox.delete(userKeyInHive);
  }

}