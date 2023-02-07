import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shopping_app/helper/controllers_binding.dart';
import 'package:shopping_app/helper/global_methods.dart';
import 'package:shopping_app/testview.dart';
import 'package:shopping_app/view/account_menu/Account_menu_view.dart';
import 'package:shopping_app/view/auth/login_view/loginview.dart';
import 'package:shopping_app/view/auth/login_view/responive_login_view.dart';
import 'package:shopping_app/view/auth/register_view/responsive_register_view.dart';
import 'package:shopping_app/view/auth/root.dart';
import 'package:shopping_app/view/cart/cart_view.dart';
import 'package:shopping_app/view/home/Responsive_home_view.dart';
import 'package:shopping_app/view/home/home_view.dart';
import 'package:shopping_app/view/product_details/product_details_view.dart';
import 'package:path_provider/path_provider.dart';

import 'model/cart_product_model/cart_product_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'model/user_model/user_model.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initiateHive();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBAg4B3Ds2hiZ-dK1p_XkGgfx57j232OX4",
            appId: "1:85507064492:web:4c16b390847534f6229509",
            messagingSenderId: "85507064492",
            projectId: "shoppingapp-7d04e")
          );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

initiateHive()async{

  if (kIsWeb) {
    await Hive.initFlutter();
  }else{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String? path=appDocDir.path;
    await Hive.initFlutter(path);
  }

  Hive.registerAdapter(CartProductModelAdapter());
  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<CartProductModel>('CartProductModel');
  await Hive.openBox<UserModel>('UserModel');
  await Hive.openBox('test');

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:RootWidget(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

