
class CategoryModel {
   String? title;
   String? image;

  CategoryModel({this.title, this.image});


  CategoryModel.fromJson(Map<String, dynamic> json){
      if(json == null ){
        return;
      }
      image = json['image'];
      title = json['title'];


  }

  toJson(){
    return {
      'image':image,
      'title':title,

    };
  }
}