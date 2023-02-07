import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/services/home_services.dart';

import '../../model/ProductModel.dart';
import '../../model/category_model.dart';


class HomeController extends GetxController{


  List<CategoryModel> _categories = [];
  List<ProductModel> _bestSellingProducts=[];

  ProductModel? _currentProduct;

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get bestSellingProducts => _bestSellingProducts;
  ProductModel? get currentProduct => _currentProduct;


  @override
  void onInit() {
    super.onInit();

    getCategories();
    getBestSellingProducts();

  }

  getCategories()async{

   List<QueryDocumentSnapshot> listQueryDocumentSnapshotCategories=
       await HomeServices().getCollectionFromFirestore();

   _categories=listQueryDocumentSnapshotCategories
       .map((e) => CategoryModel.fromJson(e.data() as Map<dynamic,dynamic>)).toList();

   print("categories $_categories");

   update();

  }

  getBestSellingProducts()async{

    //BS best selling
    List<QueryDocumentSnapshot> listQueryDocumentSnapshotBSProducts=
    await HomeServices().getBestSellingProductsFromFirestore();

    _bestSellingProducts=listQueryDocumentSnapshotBSProducts
        .map((e) => ProductModel.fromJson(e.data() as Map<dynamic,dynamic>)).toList();

    update();

  }

  updateCurrentProduct(ProductModel? newProduct){
    _currentProduct=newProduct;
    update();
  }





}