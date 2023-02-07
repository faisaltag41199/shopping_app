
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/model/user_model/user_model.dart';

class FireStoreUser{

  final CollectionReference? collectionReference=
            FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFireStore(UserModel userModel)async{

  return await  collectionReference?.doc(userModel.userId)
       .set(userModel.toJson());
  }


 Future<UserModel> getUser(String userId)async{

    DocumentSnapshot value= await collectionReference?.doc(userId).get() as DocumentSnapshot;
    return UserModel.fromJson(value.data() as Map<dynamic,dynamic>);
  }


}