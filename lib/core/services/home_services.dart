
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices{

  CollectionReference categoriesCollectionReference = FirebaseFirestore
      .instance.collection('categories');

  CollectionReference productsCollectionReference = FirebaseFirestore
      .instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCollectionFromFirestore()async{

    QuerySnapshot querySnapshotCategories=await categoriesCollectionReference.get();
    return querySnapshotCategories.docs;

  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProductsFromFirestore()async{

    QuerySnapshot querySnapshotProducts=await productsCollectionReference.get();
    return querySnapshotProducts.docs;

  }






}