import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/core/controller/cart_product_controller.dart';
import 'package:shopping_app/core/controller/home_controller.dart';
import 'package:shopping_app/model/cart_product_model/cart_product_model.dart';
import 'package:shopping_app/view/cart/cart_view.dart';
import 'package:shopping_app/view/widgets/CustomContainer.dart';
import 'package:shopping_app/view/widgets/custom_button.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';
import 'package:shopping_app/view/widgets/respnsive_layout.dart';

import '../../helper/global_methods.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller){

      if(controller.currentProduct==null){
        return Center(child: Text('No Data To Show'));
      }
      return Container(
          padding: EdgeInsets.only(left: Get.width*0.01,right: Get.width*0.01),
          height:Get.height,
          width: Get.width,
          child:SingleChildScrollView(
            child: Column(
              children: [
                Container(height:Get.height*0.9,child:Column(
                  children: [

                    Expanded(flex: 5,child: Stack(children: [

                      Container(color: Colors.grey,width:Get.width,child:
                      (controller.currentProduct!.image)!.isNotEmpty?
                      Image.network((controller.currentProduct!.image)!):
                      Image.asset("assets/ps5.jpg",fit: BoxFit.fill,),),

                      Positioned(
                        top: Get.height*0.02,
                        right: Get.width*0.02,
                        child: CustomContainer(borderRadius:100,
                          backgroundColor: Colors.white,
                          child: IconButton(onPressed: (){},icon: FaIcon(FontAwesomeIcons.heart),),
                        ),
                      ),
                      Positioned(
                        top: Get.height*0.02,
                        left: Get.width*0.02,
                        child: CustomContainer(borderRadius:100,
                          backgroundColor: Colors.white,

                          child:
                          GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (homeController){
                            return IconButton(onPressed: (){
                              ResponsiveLayout.isMobile(context)?
                                  Get.back()
                                  :homeController.updateCurrentProduct(null);
                            },icon: Icon(ResponsiveLayout.isMobile(context)?Icons.arrow_back_ios:Icons.close),) ;
                          },),
                        ),
                      ),

                    ],)),
                    Expanded(flex: 2,child: CustomText(text:(controller.currentProduct!.title)!,alignment: Alignment.centerLeft,
                      fontWeight: FontWeight.bold,)),
                    Expanded(flex: 1,child:Row(
                      children: [
                        Expanded(flex: 3,child: CustomContainer(
                            borderRadius: 40,
                            child: Row(
                              children: [
                                Expanded(flex:1,child: CustomText(text: 'Size:',)),

                                if((controller.currentProduct!.size)!.isNotEmpty)
                                  Expanded(flex: 3,child: CustomText(text:(controller.currentProduct!.size)!,)),
                              ],
                            )),),
                        Expanded(flex: 1,child: Text(' ')),
                        Expanded(flex:2,child:CustomContainer(
                            borderRadius: 40,
                            child: Row(
                              children: [
                                Expanded(child:CustomText(text: 'Color:',)),

                                if((controller.currentProduct!.color)!.isNotEmpty)
                                Expanded(child: CustomContainer(
                                  borderRadius:40,backgroundColor:Color(fromHex(controller.currentProduct!.color!)),))
                              ],
                            ))),
                      ],
                    ) ),

                    SizedBox(height:Get.height*0.03,),
                    Expanded(flex: 9,child:SingleChildScrollView(child:
                    CustomText(alignment: Alignment.centerLeft,text:(controller.currentProduct!.description)!))),

                    SizedBox(height:Get.height*0.03,),

                  ],
                )),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    height: Get.height*0.1,child:Row(
                  children: [
                    Expanded(child: Column(children: [
                      Expanded(child: CustomText(text:"Price",color:primaryColor,)),
                      Expanded(child: CustomText(text:(controller.currentProduct!.price)!,color:primaryColor,))
                    ],)),
                    Expanded(child:Container(height: Get.height*0.08,child: GetBuilder<CartProductController>(
                    init: CartProductController(),
                    builder:(cartProductController){
                      if(cartProductController.cartProductBox.containsKey(controller.currentProduct!.productId)){

                        return CustomButton(text:CustomText(text:"Go to Cart",color:Colors.white,),onPressed: (){
                          Get.to(()=>CartView());
                        },);
                      }else{
                        return CustomButton(text:CustomText(text:"ADD",color:Colors.white,),onPressed: (){
                          cartProductController.addCartProduct(
                            CartProductModel(
                              productId:controller.currentProduct!.productId ,
                              title: controller.currentProduct!.title,
                              image: controller.currentProduct!.image,
                              price: controller.currentProduct!.price,
                              quantity: 1
                            )
                          );
                        },);

                      }
                    } ,)))
                  ],
                ))
              ],
            ),
          )
      );
    },)
    ,);
  }
}
