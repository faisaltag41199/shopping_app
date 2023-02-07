import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/auth_controller.dart';
import 'package:shopping_app/core/controller/profile_controller.dart';
import 'package:shopping_app/view/auth/login_view/responive_login_view.dart';
import 'package:shopping_app/view/widgets/CustomContainer.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

import '../../constance.dart';
import '../widgets/respnsive_layout.dart';
class AccountMenuView extends StatelessWidget {
   AccountMenuView({Key? key}) : super(key: key);
  //AuthController authController=Get.find<AuthController>();

   double finalWidth=450;

  @override
  Widget build(BuildContext context) {

    finalWidth = ResponsiveLayout.isMobile(context)
        ? Get.width
        : ResponsiveLayout.isTablet(context)
        ? Get.width / 2
        : Get.width / 3;
    
    return Scaffold(body:GetBuilder<ProfileController>(
      init:ProfileController(),
      builder: (controller){
      return SingleChildScrollView(child: Container(
        height: Get.height,

        child:Column(children: [

          Expanded(flex: 1,child: Text(' ')),

          Expanded(flex: 2,child:CircleAvatar(
            child:ClipRRect(borderRadius: BorderRadius.circular(50),child:
            controller.userData==null?Container(color:primaryColor,):
            controller.userData?.image==null || (controller.userData?.image)!.isEmpty?Container(color:primaryColor,):
            Image.network((controller.userData?.image)!,fit: BoxFit.fill,)),
            radius:50,
          )),
          Container(height: Get.height*0.02,),

          Expanded(flex: 1,child: Container(
            height: Get.height*0.07,
            child: Column(
              children: [

                Expanded(child: CustomText(text:(controller.userData?.name)!,)),
                Expanded(child: CustomText(text:(controller.userData?.email)!,))
              ],
            ),
          )),

          Expanded(flex: 1,child:CustomText(text:' ')),

          Expanded(flex: 1,child:TextButton(onPressed:(){},child:ListTile(leading:FaIcon(FontAwesomeIcons.userPen),
            title:CustomText(text:'Edit Profile',alignment: Alignment.centerLeft),
          ),)),

          Expanded(flex: 1,child:TextButton(onPressed:(){},child:ListTile(leading:FaIcon(FontAwesomeIcons.locationDot),
            title:CustomText(text:'Shipping Address',alignment: Alignment.centerLeft),

          ),)),
          Expanded(flex: 1,child:TextButton(onPressed:(){},child:ListTile(leading:FaIcon(FontAwesomeIcons.clock),
            title:CustomText(text:'Order History',alignment: Alignment.centerLeft),
          ),)),
          Expanded(flex: 1,child:TextButton(onPressed:(){},child:ListTile(leading:FaIcon(FontAwesomeIcons.creditCard),
            title:CustomText(text:'Cards',alignment: Alignment.centerLeft),

          ),)),
          Expanded(flex: 1,child:TextButton(onPressed:(){},child:ListTile(leading:FaIcon(FontAwesomeIcons.bell),
            title:CustomText(text:'Notifications',alignment: Alignment.centerLeft),

          ),)),
          Expanded(flex: 1,child:TextButton(onPressed:(){

            controller.signOut();
            Get.offAll(ResponsiveLoginView());

          },child:ListTile(leading:Icon(Icons.exit_to_app),
            title:CustomText(text:'Log Out',alignment: Alignment.centerLeft),

          ),)),

          Expanded(flex: 3,child:CustomText(text:' ')),

        ],),
      ),);
    },));
  }
}
