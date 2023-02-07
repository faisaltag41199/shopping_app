import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/auth_controller.dart';
import 'package:shopping_app/view/home/home_view.dart';

import '../../../constance.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/respnsive_layout.dart';
import '../../widgets/socail_auth_custom_button.dart';

class RegisterView extends GetWidget<AuthController> {

  RegisterView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key =GlobalKey<FormState>();
  double finalHeight=600;
  double finalWidth=400;

  @override
  Widget build(BuildContext context) {
    finalHeight=Get.height;
    finalWidth=ResponsiveLayout.isMobile(context)?Get.width:
    ResponsiveLayout.isTablet(context)?Get.width/2:Get.width/3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.black),
        onPressed: (){
          Get.back();
        },
        ),
        elevation:0,
        backgroundColor:Colors.white ,
      ),
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.only(left:finalWidth*0.05,right:finalWidth*0.05),
          height:Get.height*0.92,
          width: Get.width,
          color: Colors.white,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height:Get.height*0.01 ,),
                CustomText(text:'Sign Up',alignment: Alignment.centerLeft,color: Colors.black,fontSize:(finalWidth+finalHeight)/48.0),

                SizedBox(height:Get.height*0.07 ,),

                Container(height:Get.height*0.09,width: finalWidth,child:CustomTextFormField(
                  alignment: Alignment.centerLeft,
                  text: "Name",hintText:"faisaltageldin",
                  textSize:((finalWidth+finalHeight)/73.0),
                  hintTextSize: ((finalWidth+finalHeight)/85.0),
                    onSave: (value){
                      controller.name=value!;
                    },
                    validator: (value){
                      if(value==null){
                        return "name can't be empty";
                      }
                      else if(value.isEmpty){
                        return "name can't be empty";
                      }
                      else{
                        return null;
                      }
                    }
                ) ,),
                SizedBox(height:Get.height*0.02 ,),

                Container(height:Get.height*0.09,width: finalWidth,child:CustomTextFormField(
                  alignment: Alignment.centerLeft,
                  text: "Email",hintText:"faisaltag41199@gmail.com",
                  textSize:((finalWidth+finalHeight)/73.0),
                  hintTextSize: ((finalWidth+finalHeight)/85.0),
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
                    }
                ) ,),
                SizedBox(height:Get.height*0.02 ,),

                Container(height:Get.height*0.09,width: finalWidth,child:CustomTextFormField(
                  alignment: Alignment.centerLeft,
                  text: "Password",hintText:"********",
                  textSize: ((finalWidth+finalHeight)/73.0),
                  hintTextSize: ((finalWidth+finalHeight)/85.0),
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
                    }

                ) ,),

                SizedBox(height:Get.height*0.09 ,),

                Container(height:Get.height*0.05,width: finalWidth,
                  child: TextButton(onPressed: (){
                    _key.currentState!.save();
                    if(_key.currentState!.validate()){
                      controller.signUpWithEmailAndPassword();
                    }
                  }, child: CustomText(text:"Sign Up",color: Colors.white,fontSize:(finalWidth+finalHeight)/90.0 ,),
                    style: TextButton.styleFrom(backgroundColor:primaryColor

                    ),),
                ),


              ],),
          ),
        ),
      ),



    );
  }
}
