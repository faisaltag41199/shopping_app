import 'package:hive/hive.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId:1)
class CartProductModel{
  @HiveField(0)
  String? productId;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? image;

  @HiveField(3)
  String? price;

  @HiveField(4)
  int? quantity;

  CartProductModel({this.productId,this.title,this.image,this.price,this.quantity});

}

