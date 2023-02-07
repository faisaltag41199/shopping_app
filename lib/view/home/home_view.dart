import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/controller/cart_product_controller.dart';
import 'package:shopping_app/view/account_menu/Account_menu_view.dart';
import 'package:shopping_app/view/cart/cart_view.dart';
import 'package:shopping_app/view/product_details/product_details_view.dart';
import 'package:shopping_app/view/widgets/CustomContainer.dart';
import 'package:shopping_app/view/widgets/respnsive_layout.dart';

import '../../constance.dart';
import '../../core/controller/home_controller.dart';
import '../widgets/custom_text.dart';

class HomeView extends GetWidget<HomeController> {
  HomeView({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> _key =GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
          decoration: BoxDecoration(
           border: ResponsiveLayout.isMobile(context)?null:
           Border(
               right:BorderSide(color:Colors.grey,),
             left: ResponsiveLayout.isTablet(context)?BorderSide(color: Colors.transparent)
                 :BorderSide(color:Colors.grey,)

           )
          ),
          padding: EdgeInsets.only(left: Get.width*0.03,)

          ,width:Get.width,height:Get.height ,child:Column(children: [

        Container(height:Get.height*0.03,child: Text(' ')),
        Expanded(
          flex: 1,
          child: Row(children: [
           if(!ResponsiveLayout.isWeb(context))
             Expanded(flex:1,child: IconButton(icon: Icon(Icons.menu),onPressed: (){
              _key.currentState?.openDrawer();
            },)),
            Expanded(flex:6,child: searchTextFormField()),
            Expanded(flex:1,child: IconButton(icon:FaIcon(FontAwesomeIcons.bagShopping),onPressed: (){

              Get.put(CartProductController()).getAllCardProducts();
              Get.to(()=>CartView());
            },)),
          ],),
        ),
        Container(height:Get.height*0.03,child: Text(' ')),
        Expanded(flex:1,child:CustomText(alignment: Alignment.centerLeft,text:"Categories",fontWeight: FontWeight.bold,)),
        Container(height:Get.height*0.02,child: Text(' ')),
        Expanded(
          flex: 2,
          child: Container(
            width: Get.width,
            child: categoriesListView(),
          ),
        ),
        Expanded(flex: 1,child: Text(' ')),
        Expanded(
          flex: 2,
          child: Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,children: [
            CustomText(text:"Best Selling" ,fontWeight: FontWeight.bold,),
            Container(padding:EdgeInsets.only(right: Get.width*0.02),child: CustomText(text:"See All" ))
          ],),
        ),
        Expanded(
          flex: 10,
          child: Container(
            width: Get.width,
            height: Get.height*0.5,
            child: bestSellingProductsListView(context),
          ),
        ),
        Expanded(flex: 1,child: Text(' '))

      ],)),
      drawer:Drawer(
        child: AccountMenuView()),
    );
  }


  Widget searchTextFormField(){
    return CustomContainer(borderRadius: 30,backgroundColor: Colors.grey[300],
      showBorder: false ,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),),
    );
  }

  Widget categoriesListView(){
    return
      GetBuilder<HomeController>(
          init:HomeController(),
          builder: (controller){
        return    ListView.separated(
            scrollDirection:Axis.horizontal,itemBuilder: (context,index){
          return Column(children: [
            Expanded(
              flex: 2,
              child: CustomContainer(
                width: Get.height*0.09,
                borderRadius: 50,
                backgroundColor: Colors.grey[300],
                showBorder: false,
                child:Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.network((controller.categories[index].image)!,fit: BoxFit.cover,height:Get.height*0.06),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: CustomText(text:(controller.categories[index].name)! ,)),
          ],);
        }, separatorBuilder: (context,index){
          return SizedBox(width: 20,);
        }, itemCount:controller.categories.length ) ;
      });

  }

  Widget bestSellingProductsListView(context){

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller){

    return ListView.separated(scrollDirection:Axis.horizontal,itemBuilder: (context,index){
      return TextButton(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            flex: 10,
            child: CustomContainer(
              borderRadius: 50,
              backgroundColor: Colors.grey[300],
              showBorder: false,
              child:ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network((controller.bestSellingProducts[index]
                .image)!,fit: BoxFit.cover,)),
            ),
          ),
          Expanded(flex:2,child: SizedBox(
              width:ResponsiveLayout.isMobile(context)?Get.width*0.5:Get.width*0.15 ,
              child: CustomText(alignment: Alignment.centerLeft,text:(controller.bestSellingProducts[index].title)! ,fontWeight: FontWeight.bold,))),
          Expanded(flex:1,child: CustomText(text:(controller.bestSellingProducts[index].brand)! ,color: Colors.grey,)),
          Expanded(flex:1,child: CustomText(text:(controller.bestSellingProducts[index].price)! ,color: Colors.grey,)),

        ],),
        onPressed: (){

           if(controller.currentProduct!=null ){

             if(controller.bestSellingProducts[index].productId==controller.currentProduct!.productId &&
                 !ResponsiveLayout.isMobile(context)){
               controller.updateCurrentProduct(null);
             }else{
               controller.updateCurrentProduct(controller.bestSellingProducts[index]);
             }
           }else{

             controller.updateCurrentProduct(controller.bestSellingProducts[index]);
           }

           if(ResponsiveLayout.isMobile(context)){
             print(controller.currentProduct);
             Get.to(()=>ProductDetailsView());
           }

        },
      );
    }, separatorBuilder: (context,index){
      return SizedBox(width: Get.width*0.05,);
    }, itemCount: controller.bestSellingProducts.length) ;

    });

  }
}


