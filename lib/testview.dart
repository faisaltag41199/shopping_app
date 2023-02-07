import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'model/cart_product_model/cart_product_model.dart';

class TestoView extends StatelessWidget {
  const TestoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:TextButton(onPressed: (){
       // Box hive=Hive.box('test');
     //   hive.put('1', 'fai');
      //  Box hive=Hive.box<CartProductModel>('CartProductModel');
        //hive.clear();
        //print(hive.values);


      },child:Image.network("https://lh3.googleusercontent.com/a/AEdFTp5S_LBNOXES994axqYslJkMKgZCqQ-L9br9Nn1QFA=s96-c"),),),
    );
  }
}
