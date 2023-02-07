import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/core/controller/cart_product_controller.dart';
import 'package:shopping_app/model/cart_product_model/cart_product_model.dart';
import '../../constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Get.back();
      }, icon:Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:GetBuilder<CartProductController>(
    init:CartProductController(),
    builder:(cartProductController){
      return cartProductController.cardProducts.isEmpty?
          SingleChildScrollView(
            child: Column(children: [

              SizedBox(height: Get.height*0.1 ,),
              Container(
                  height: Get.height*0.7,
                  width: Get.width*0.7,

                  child: SvgPicture.asset('assets/cartempty.svg')),
              CustomText(text: "Empty Cart",)
            ],),
          )
          :Container(
        child: Column(children: [
          Expanded(
            flex: 9,
            child: Container(child:ListView.separated(itemBuilder:(context,index){

              return Dismissible(
                key: ObjectKey(cartProductController.cardProducts[index]),
                background: Container(padding: EdgeInsets.only(left:Get.width*0.6),color: Colors.red,child:const Icon(Icons.delete),),
                onDismissed: (direction){

                  cartProductController.deleteCartProduct(
                      cartProductController.cardProducts[index].productId!
                  );

                },
                child: Container(
                  height: Get.height*0.15,
                  child: Row(
                    children: [
                      Expanded(flex: 3,child: Container(
                        color: Colors.grey,
                        child:cartProductController.cardProducts[index].image==null || cartProductController.cardProducts[index].image!.isEmpty?
                            Text('no image'):
                        Image.network((cartProductController.cardProducts[index].image)!),
                      )),
                      SizedBox(width: Get.width*0.05,),
                      Expanded(flex: 3,child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(child: CustomText(alignment: Alignment.centerLeft,text:(cartProductController.cardProducts[index].title)!,)),
                          Expanded(child: CustomText(alignment:Alignment.centerLeft,text:(cartProductController.cardProducts[index].price)!,)),
                          Expanded(child: Text('  ')),
                          Expanded(child: Container(
                            color: Colors.grey[300],
                            width: Get.width*0.2,
                            child: Row(
                              children: [
                                Expanded(child: TextButton(onPressed: (){
                                  cartProductController.increaseQuantity(cartProductController.cardProducts[index]);
                                }, child:CustomText(text:'+',),)),
                                Expanded(child: TextButton(onPressed: (){}, child:CustomText(
                                    text:cartProductController.cardProducts[index].quantity.toString()),)),
                                Expanded(child: TextButton(onPressed: (){
                                  cartProductController.decreaseQuantity(cartProductController.cardProducts[index]);
                                }, child:CustomText(text:'-',)))

                              ],),
                          ))

                        ],
                      ))
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (context,index){
              return SizedBox(height: Get.height*0.02,);
            }, itemCount: cartProductController.cardProducts.length),),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
              height: Get.height*0.13,child:Row(
            children: [
              Expanded(flex:1,child: Container(
                height: Get.height*0.08,
                child: Column(children: [
                  Expanded(child: CustomText(text:"TotalPrice",color:primaryColor,)),
                  Expanded(child: CustomText(text:"${cartProductController.totalPrice} usd",color:primaryColor,))
                ],),
              )),
              Expanded(child:Container(height:Get.height*0.08,child: CustomButton(onPressed: ()async{
                Box hive=Hive.box('test');
                //  hive.put('1', 'faisal');
                // hive.put('2', 'tag');

              },text:CustomText(text:"Checkout",color:Colors.white,),)))
            ],
          ))
        ],),
      );
    },),);
  }
}
