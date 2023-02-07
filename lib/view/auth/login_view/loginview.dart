import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/auth_controller.dart';
import 'package:shopping_app/view/auth/register_view/responsive_register_view.dart';
import 'package:shopping_app/view/widgets/custom_button.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';
import 'package:shopping_app/view/widgets/custom_text_form_field.dart';
import 'package:shopping_app/view/widgets/respnsive_layout.dart';
import 'package:shopping_app/view/widgets/socail_auth_custom_button.dart';

import '../../../constance.dart';

class LoginView extends GetWidget<AuthController> {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key =GlobalKey<FormState>();
  double finalHeight = 600;
  double finalWidth = 400;

  @override
  Widget build(BuildContext context) {
    finalHeight = Get.height;
    finalWidth = ResponsiveLayout.isMobile(context)
        ? Get.width
        : ResponsiveLayout.isTablet(context)
            ? Get.width / 2
            : Get.width / 3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: finalWidth * 0.05, right: finalWidth * 0.05),
          height: Get.height * 0.92,
          width: Get.width,
          color: Colors.white,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: CustomText(
                          text: "Welcome,",
                          color: Colors.black,
                          alignment: Alignment.centerLeft,
                          fontSize: (finalWidth + finalHeight) / 48.0,
                        )),
                    Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: (){
                            Get.to(()=>ResponsiveRegisterView());
                          },
                          child: CustomText(
                              text: 'Sign Up',
                              color: primaryColor,
                              fontSize: (finalWidth + finalHeight) / 75.0),
                        )),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                CustomText(
                    text: 'Sign In To Continue',
                    alignment: Alignment.centerLeft,
                    color: primaryColor,
                    fontSize: (finalWidth + finalHeight) / 85.0),
                SizedBox(
                  height: Get.height * 0.07,
                ),
                Container(
                  height: Get.height * 0.09,
                  width: finalWidth,
                  child: CustomTextFormField(
                    alignment: Alignment.centerLeft,
                    text: "Email",
                    hintText: "faisaltag41199@gmail.com",
                    textSize: ((finalWidth + finalHeight) / 73.0),
                    hintTextSize: ((finalWidth + finalHeight) / 85.0),
                    onSave: (value){
                      controller.email=value!;
                    },
                    validator: (value){
                      if(value==null){
                        return "email can't be empty";
                      }
                      else if(value.isEmpty){
                        return "email can't be empty";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.09,
                  width: finalWidth,
                  child: CustomTextFormField(
                    alignment: Alignment.centerLeft,
                    text: "Password",
                    hintText: "********",
                    textSize: ((finalWidth + finalHeight) / 73.0),
                    hintTextSize: ((finalWidth + finalHeight) / 85.0),
                    onSave: (value){
                      controller.password=value!;
                    },
                    validator: (value){
                      if(value==null){
                        return "password can't be empty";
                      } else if(value.isEmpty){
                        return "password can't be empty";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                    width: finalWidth,
                    child: CustomText(
                        text: 'Forgot Password?',
                        alignment: Alignment.centerRight,
                        fontSize: (finalWidth + finalHeight) / 85.0)
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: finalWidth,
                  child: CustomButton(
                    onPressed: () {
                      _key.currentState!.save();
                      if(_key.currentState!.validate()){
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    text: CustomText(
                      text: "Sign In",
                      color: Colors.white,
                      fontSize: (finalWidth + finalHeight) / 90.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                CustomText(
                    text: "-OR-", fontSize: (finalWidth + finalHeight) / 85.0),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: finalWidth,
                  child: SocialAuthCustomButton(
                    onClick: () {
                      controller.signInWithGoogle();
                    },
                    text: CustomText(
                        text: "Sign In With Google",
                        fontSize: (finalWidth + finalHeight) / 90.0),
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      size: (finalWidth + finalHeight) / 80.0,
                      color: Colors.black,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


