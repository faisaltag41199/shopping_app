
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/model/cart_product_model/cart_product_model.dart';

class CartProductController extends GetxController{

  late Box cartProductBox;
  List<CartProductModel> _cardProducts=[];
  double _totalPrice=0.0;


  List<CartProductModel> get cardProducts=> _cardProducts;
  double get totalPrice => _totalPrice;


  @override
  void onInit() {
    super.onInit();
      cartProductBox= Hive.box<CartProductModel>('CartProductModel');
       getAllCardProducts();
  }

  addCartProduct(CartProductModel cartProduct){
    cartProductBox.put(cartProduct.productId,cartProduct);
    getAllCardProducts();
    update();
  }
  getAllCardProducts(){
    _cardProducts=cartProductBox.values.toList() as List<CartProductModel>;
    _totalPrice=getTotalPrice();
    update();
  }

  double getTotalPrice(){
    double allProductsPrice=0.0;

    for(int i=0;i<_cardProducts.length;i++){

      allProductsPrice +=double.parse((_cardProducts[i].price)!)*(_cardProducts[i].quantity)!;
    }

    return allProductsPrice;
  }

  increaseQuantity(CartProductModel cartProduct){

    print('IN increaseQuantity');
    int quantity=(cartProduct.quantity)!;
    cartProduct.quantity=++quantity;
    cartProductBox.put(cartProduct.productId, cartProduct);
    getAllCardProducts();
    update();
  }

  decreaseQuantity(CartProductModel cartProduct){
    int quantity=(cartProduct.quantity)!;
    if(quantity<=0) return ;
    cartProduct.quantity=--quantity;
    cartProductBox.put(cartProduct.productId, cartProduct);
    getAllCardProducts();
    update();
  }

  deleteCartProduct(String cartProductId){
    cartProductBox.delete(cartProductId);
    getAllCardProducts();
    update();
  }

}