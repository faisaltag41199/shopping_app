
class CategoryModel{
  String? name,image;

  CategoryModel({this.name,this.image});

  CategoryModel.fromJson(Map<dynamic,dynamic> jsonData){

    if(jsonData==null) return ;

    name=jsonData['name'];
    image=jsonData['image'];

  }

  toJson(){
    return {
      'name':name,
      'image':image,
    };
  }



}