import 'package:get/get.dart';
import 'package:shopping_app/core/controller/auth_controller.dart';
import 'package:shopping_app/core/controller/cart_product_controller.dart';
import 'package:shopping_app/core/controller/home_controller.dart';
import 'package:shopping_app/model/cart_product_model/cart_product_model.dart';

import '../core/controller/profile_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {

   Get.lazyPut(() => AuthController());
   Get.lazyPut(() => HomeController());
   Get.lazyPut(() => CartProductController());
   Get.lazyPut(() => ProfileController());

  }

}