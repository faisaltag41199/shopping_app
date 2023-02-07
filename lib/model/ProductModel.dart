
class ProductModel{

  String? productId,title,image,description,color,size,price,brand,categoryId;

  ProductModel({this.productId,this.title,this.description,this.color,this.image,this.size,this.price,this.brand,this.categoryId});

  ProductModel.fromJson(Map<dynamic,dynamic> jsonData){

    if(jsonData==null) return ;

    productId=jsonData['productId'];
    title=jsonData['title'];
    description=jsonData['description'];
    color=jsonData['color'];
    image=jsonData['image'];
    brand=jsonData['brand'];
    size=jsonData['size'];
    price=jsonData['price'];
    categoryId=jsonData['categoryId'];
  }


  toJson(){
    return {
      'productId':productId,
      'title':title,
      'description':description,
      'color':color,
      'image':image,
      'brand':brand,
      'size':size,
      'price':price,
      'categoryId':categoryId,
    };
  }

}