import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/auth_controller.dart';
import 'package:shopping_app/core/controller/profile_controller.dart';
import 'package:shopping_app/view/home/Responsive_home_view.dart';

import '../home/home_view.dart';
import 'login_view/responive_login_view.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder:(controller){
       return controller.userData==null? ResponsiveLoginView():ResponsiveHomeView();
    });
  }
}
