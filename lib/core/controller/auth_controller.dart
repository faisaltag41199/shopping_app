
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/controller/profile_controller.dart';
import 'package:shopping_app/core/services/FireStoreUser.dart';
import 'package:shopping_app/model/user_model/user_model.dart';
import 'package:shopping_app/view/home/Responsive_home_view.dart';
import 'package:shopping_app/view/product_details/product_details_view.dart';
import '../../view/home/home_view.dart';

class AuthController extends GetxController{

  GoogleSignIn googleSignIn=GoogleSignIn(scopes: ['email']);
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  String name='',email='',password='';
  final ProfileController profileController=Get.find();

  //UserModel _userData=UserModel(name: "username",email: "example@gmail.com",image:"",userId: "");

  Rxn<User?> authUser=Rxn<User?>();
  String? get user => authUser.value?.email;

  //UserModel get userData => _userData;

  @override
  void onInit() {
    super.onInit();
    print(firebaseAuth.currentUser?.uid);
    print("/////////////////////////////////////////////");
    authUser.bindStream(firebaseAuth.authStateChanges());
  //  getUserData();
  }


  void signInWithGoogle()async{
    final googleUser= await googleSignIn.signIn();
    print(googleUser);
    final GoogleSignInAuthentication googleSignInAuthentication= await googleUser!.authentication;
    final AuthCredential credential= GoogleAuthProvider.credential(
      idToken:googleSignInAuthentication.idToken ,
      accessToken:googleSignInAuthentication.accessToken ,
    );
    await firebaseAuth.signInWithCredential(credential).then((value){
      saveUser(value).then((value) => Get.offAll(()=>ResponsiveHomeView()));
    });
  }

  void signInWithEmailAndPassword()async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email,password: password).then((value) async{
        await FireStoreUser().getUser(value.user!.uid).then((value) {
          profileController.setUser(value);
          Get.offAll(()=>ResponsiveHomeView());
        }
        );
      }
      );

    }catch(e){
      print(e.toString());
      Get.snackbar('login error', e.toString(),colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }
  void signUpWithEmailAndPassword()async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email,password: password).then((value)async {

        await saveUser(value).then((value) => Get.offAll(()=>ResponsiveHomeView()));
      }
      );
    }catch(e){
      print(e.toString());
      Get.snackbar('login error', e.toString(),colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveUser(UserCredential userCredential)async{

    print(userCredential.user);
    print(userCredential.user!.displayName);

    UserModel userModel=UserModel(
        userId: userCredential.user?.uid,
        name:name==null || name.isEmpty ? userCredential.user!.displayName:name,
        email: email==null || email.isEmpty?userCredential.user!.email:email ,
        image: userCredential.user?.photoURL
    );

    profileController.setUser(userModel);
    return await FireStoreUser().addUserToFireStore(userModel);


  }

  /*getUserData()async{

    if(firebaseAuth.currentUser != null){
      _userData =await FireStoreUser().getUser(firebaseAuth.currentUser!.uid);
      update();
    }

  }*/

}