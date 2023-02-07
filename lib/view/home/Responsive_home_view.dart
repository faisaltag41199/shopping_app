import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/home_controller.dart';
import 'package:shopping_app/view/account_menu/Account_menu_view.dart';
import 'package:shopping_app/view/home/home_view.dart';
import 'package:shopping_app/view/product_details/product_details_view.dart';
import 'package:shopping_app/view/widgets/respnsive_layout.dart';

class ResponsiveHomeView extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return ResponsiveLayout(mobile: HomeView(),

        tablet: GetBuilder<HomeController>(
          builder: (controller){
          return Row(children: [
            Expanded(child: HomeView()),

            if(controller.currentProduct != null)
            Expanded(child: ProductDetailsView())
          ],);
         },)
        , web:GetBuilder<HomeController>(builder: (controller){
          return Row(children: [
            Expanded(flex:1,child: AccountMenuView(),),
            Expanded(flex:3,child: HomeView()),

            if(controller.currentProduct != null)
              Expanded(flex:2,child: ProductDetailsView()),

          ],);
          },) );

  }



}